const sql = require("./db.js");

//constructor
const MiembroFotografia = function (miembroFotografia) {
  this.foto = miembroFotografia.foto
  this.id_miembro = miembroFotografia.id_miembro;
}

//guardando en la bd miembro anciano 
MiembroFotografia.createMiembroFotografia = (nuevoMiembroFotografia, result) => {
  sql.query("INSERT INTO fotografia SET ?", nuevoMiembroFotografia, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("fotografia creado: ", { id: res.insertId, ...nuevoMiembroFotografia });
    result(null, { id: res.insertId, ...nuevoMiembroFotografia });
  });
};


//guradando las modificaciones de miembro en la base de datos
MiembroFotografia.updateById = (id, miembroFotografia, result) => {
  sql.query(
    "UPDATE fotografia SET foto= ? WHERE id_fotografia = ? ", [miembroFotografia.foto, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        result({ kind: "no_encontrado" }, null);
        return;
      }

      console.log("fotografia actualizado: ", { id: id, ...miembroFotografia });
      result(null, { id: id, ...miembroFotografia });
    }
  );
};


module.exports = MiembroFotografia;