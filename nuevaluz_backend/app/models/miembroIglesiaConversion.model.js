const sql = require("./db.js");

//constructor
const MiembroIglesiaConversion = function (miembroIglesiaConversion) {
    this.nombre_iglesia_conv = miembroIglesiaConversion.nombre_iglesia_conv;
    this.id_miembro = miembroIglesiaConversion.id_miembro;
}

//guardando en la bd miembro en la tabla miembro
MiembroIglesiaConversion.createMiembroIglesiaConversion= (nuevoMiembroIglesiaConversion, result) => {
    sql.query("INSERT INTO iglesia_conversion SET ?", nuevoMiembroIglesiaConversion, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("iglesia conversion creado: ", { id: res.insertId, ...nuevoMiembroIglesiaConversion });
      result(null, { id: res.insertId, ...nuevoMiembroIglesiaConversion });
    });
  };
  
  
  module.exports = MiembroIglesiaConversion;