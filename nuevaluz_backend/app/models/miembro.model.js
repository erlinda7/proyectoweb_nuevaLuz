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
  this.id_fotografia =miembro.id_fotografia;
  this.foto = miembro.foto;
  this.id_cargo_lider = miembro.id_cargo_lider;
  this.nombre_cargo = miembro.nombre_cargo;
  this.id_gestion_cargo = miembro.id_gestion_cargo;
  this.fecha_inicio = miembro.fecha_inicio;
  this.fecha_fin = miembro.fecha_fin;
}

Miembro.getAll = resultado => {
  sql.query(
    "SELECT m.id_miembro, m.nombre, m.apellido_paterno, m.apellido_materno, m.telefono, m.estado_civil,  " +
    "DATE_FORMAT(m.fecha_nac, '%Y-%m-%d') fecha_nac, " +
    "DATE_FORMAT(m.fecha_conversion, '%Y-%m-%d') fecha_conversion, m.iglesia_conversion, " +
    "DATE_FORMAT(m.fecha_bautizo, '%Y-%m-%d') fecha_bautizo, m.iglesia_bautizo, " +
    "m.nom_completo_pastor_bautizo, " +

    "f.id_fotografia, f.foto, " +

    "c.id_cargo_lider, c.nombre_cargo, " +

    "g.id_gestion_cargo, DATE_FORMAT(g.fecha_inicio, '%Y-%m-%d')  fecha_inicio, DATE_FORMAT(g.fecha_fin, '%Y-%m-%d')  fecha_fin " +


    "FROM miembro m " +
    "LEFT JOIN fotografia f ON m.id_miembro=f.id_miembro " +
    "LEFT JOIN cargo_lider c ON m.id_miembro=c.id_miembro " +
    "LEFT JOIN gestion_cargo g ON m.id_miembro=g.id_miembro "

    , (err, res) => {
      if (err) {
        console.log("Error al recuperar", err);
        resultado(null, err);
        return;
      }
      console.log("miembro:", res);
      resultado(null, res);

    })


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