const sql = require("./db.js");

//constructor
const MiembroGestionCargo = function (miembroGestionCargo) {
    this.fecha_inicio = miembroGestionCargo.fecha_inicio
    this.fecha_fin = miembroGestionCargo.fecha_fin
    this.id_miembro = miembroGestionCargo.id_miembro;
}

//guardando en la bd gestion_cargo del miembro 
MiembroGestionCargo.createMiembroGestionCargo= (nuevoMiembroGestionCargo, result) => {
    sql.query("INSERT INTO gestion_cargo SET ?", nuevoMiembroGestionCargo, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("gestion_cargo creado: ", { id: res.insertId, ...nuevoMiembroGestionCargo });
      result(null, { id: res.insertId, ...nuevoMiembroGestionCargo });
    });
  };
  
  
  //guradando las modificaciones de miembro en la base de datos
MiembroGestionCargo.updateById = (id, miembroGestionCargo, result) => {
  sql.query(
    "UPDATE gestion_cargo SET fecha_inicio = ?, fecha_fin = ? WHERE id_gestion_cargo = ? ", 
    [ miembroGestionCargo.fecha_inicio, miembroGestionCargo.fecha_fin, id],
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

      console.log("gestion_cargo actualizado: ", { id: id, ...miembroGestionCargo });
      result(null, { id: id, ...miembroGestionCargo });
    }
  );
};

  module.exports = MiembroGestionCargo;