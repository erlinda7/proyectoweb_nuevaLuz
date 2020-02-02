const sql = require("./db.js");

//constructor
const MiembroCargoLider = function (miembroCargoLider) {
  this.nombre_cargo = miembroCargoLider.nombre_cargo
  this.id_miembro = miembroCargoLider.id_miembro;
}

//guardando en la bd cargo_lider del miembro 
MiembroCargoLider.createMiembroCargoLider = (nuevoMiembroCargoLider, result) => {
  sql.query("INSERT INTO cargo_lider SET ?", nuevoMiembroCargoLider, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("cargo_lider creado: ", { id: res.insertId, ...nuevoMiembroCargoLider });
    result(null, { id: res.insertId, ...nuevoMiembroCargoLider });
  });
};

//guradando las modificaciones de miembro en la base de datos
MiembroCargoLider.updateById = (id, miembroCargoLider, result) => {
  sql.query(
    "UPDATE cargo_lider SET nombre_cargo = ? WHERE id_cargo_lider = ? ", [miembroCargoLider.nombre_cargo, id],
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

      console.log("cargo_lider actualizado: ", { id: id, ...miembroCargoLider });
      result(null, { id: id, ...miembroCargoLider });
    }
  );
};

module.exports = MiembroCargoLider;