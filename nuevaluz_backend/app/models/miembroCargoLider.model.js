const sql = require("./db.js");

//constructor
const MiembroCargoLider = function (miembroCargoLider) {
    this.nombre_cargo = miembroCargoLider.nombre_cargo
    this.id_miembro = miembroCargoLider.id_miembro;
}

//guardando en la bd cargo_lider del miembro 
MiembroCargoLider.createMiembroCargoLider= (nuevoMiembroCargoLider, result) => {
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
  
  
  module.exports = MiembroCargoLider;