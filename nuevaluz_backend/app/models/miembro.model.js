const sql = require("./db.js");

//constructor
const Miembro = function (miembro) {
  this.id_miembro = miembro.id_miembro;
  this.nombre = miembro.nombre;
  this.apellido_paterno = miembro.apellido_paterno;
  this.apellido_materno = miembro.apellido_materno;
  this.telefono = miembro.telefono;
  this.estado_civil = miembro.estado_civil;
  this.fecha_nac = miembro.fecha_nac;
  this.fecha_conversion = miembro.fecha_conversion;
  this.iglesia_conversion = miembro.iglesia_conversion;
  this.fecha_bautizo = miembro.fecha_bautizo;
  this.iglesia_bautizo = miembro.iglesia_bautizo;
  this.nom_completo_pastor_bautizo = miembro.nom_completo_pastor_bautizo;
}


//guardando en la bd miembro en la tabla miembro
Miembro.createMiembro = (nuevoMiembro, result) => {
  sql.query("INSERT INTO miembro SET ?", nuevoMiembro, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("miembro creado: ", { id: res.insertId, ...nuevoMiembro });
    result(null, { id: res.insertId, ...nuevoMiembro });
  });
};


module.exports = Miembro;