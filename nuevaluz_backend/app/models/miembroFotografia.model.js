const sql = require("./db.js");

//constructor
const MiembroFotografia = function (miembroFotografia) {
    this.foto = miembroFotografia.foto
    this.id_miembro = miembroFotografia.id_miembro;
}

//guardando en la bd miembro anciano 
MiembroFotografia.createMiembroFotografia= (nuevoMiembroFotografia, result) => {
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
  
  
  module.exports = MiembroFotografia;