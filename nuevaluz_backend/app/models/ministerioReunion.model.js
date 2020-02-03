const sql = require("./db.js");

//constructor
const MinisterioReunion = function (ministerioReunion) {
  this.id_reunion_ministerio = ministerioReunion.id_reunion_ministerio;
  this.dia = ministerioReunion.dia;
  this.hora_inicio = ministerioReunion.hora_inicio;
  this.hora_fin = ministerioReunion.hora_fin;
  this.id_ministerio = ministerioReunion.id_ministerio;

}


//guardando en la bd ministerio
MinisterioReunion.create = (nuevoMinisterioReunion, result) => {
  sql.query("INSERT INTO reunion_ministerio SET ?", nuevoMinisterioReunion, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("Reunion ministerio creado: ", { id: res.insertId, ...nuevoMinisterioReunion });
    result(null, { id: res.insertId, ...nuevoMinisterioReunion });
  });
};


//guardando las modificaciones de ministerio en la base de datos
MinisterioReunion.updateById = (id, ministerioReunion, result) => {
  sql.query(
    "UPDATE reunion_ministerio SET dia = ?, hora_inicio = ?, hora_fin = ?, id_ministerio = ? WHERE id_reunion_ministerio = ?",
    [ministerioReunion.dia, ministerioReunion.hora_inicio, ministerioReunion.hora_fin, ministerioReunion.id_ministerio, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // evento no encontrado por id
        result({ kind: "no_encontrado" }, null);
        return;
      }

      console.log("reunion ministerio actualizado: ", { id: id, ...ministerioReunion });
      result(null, { id: id, ...ministerioReunion });
    }
  );
};



module.exports = MinisterioReunion;