const sql = require("./db.js");

//constructor
const MiembroPastor = function (miembroPastor) {
    this.foto = miembroPastor.foto
    this.id_miembro = miembroPastor.id_miembro;
}

//guardando en la bd miembro pastor 
MiembroPastor.createMiembroPastor= (nuevoMiembroPastor, result) => {
    sql.query("INSERT INTO pastor SET ?", nuevoMiembroPastor, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("pastor creado: ", { id: res.insertId, ...nuevoMiembroPastor });
      result(null, { id: res.insertId, ...nuevoMiembroPastor });
    });
  };
  
  
  module.exports = MiembroPastor;