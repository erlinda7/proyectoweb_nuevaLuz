const sql = require("./db.js");

//constructor
const MiembroIglesiaBautizo = function (miembroIglesiaBautizo) {
    this.nombre_iglesia_bau = miembroIglesiaBautizo.nombre_iglesia_bau;
    this.id_miembro = miembroIglesiaBautizo.id_miembro;
}

//guardando en la bd miembro en la tabla iglesia_bautizo
MiembroIglesiaBautizo.createMiembroIglesiaBautizo= (nuevoMiembroIglesiaBautizo, result) => {
    sql.query("INSERT INTO iglesia_bautizo SET ?", nuevoMiembroIglesiaBautizo, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("iglesia Bautizo creado: ", { id: res.insertId, ...nuevoMiembroIglesiaBautizo });
      result(null, { id: res.insertId, ...nuevoMiembroIglesiaBautizo });
    });
  };
  
  
  module.exports = MiembroIglesiaBautizo;