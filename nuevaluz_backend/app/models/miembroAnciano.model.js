const sql = require("./db.js");

//constructor
const MiembroAnciano = function (miembroAnciano) {
    this.foto = miembroAnciano.foto
    this.id_miembro = miembroAnciano.id_miembro;
}

//guardando en la bd miembro anciano 
MiembroAnciano.createMiembroAnciano= (nuevoMiembroAnciano, result) => {
    sql.query("INSERT INTO anciano SET ?", nuevoMiembroAnciano, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("anciano creado: ", { id: res.insertId, ...nuevoMiembroAnciano });
      result(null, { id: res.insertId, ...nuevoMiembroAnciano });
    });
  };
  
  
  module.exports = MiembroAnciano;