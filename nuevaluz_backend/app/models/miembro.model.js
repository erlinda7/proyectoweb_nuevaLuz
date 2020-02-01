const sql = require("./db.js");

//constructor
const Miembro = function (miembro) {
    this.nombre = miembro.nombre;
    this.apellido_paterno = miembro.apellido_paterno;
    this.apellido_materno = miembro.apellido_materno;
    this.telefono = miembro.telefono;
    this.estado_civil = miembro.estado_civil;
    this.fecha_nac = miembro.fecha_nac;
    this.fecha_conversion = miembro.fecha_conversion;
    this.fecha_bautizo = miembro.fecha_bautizo;
    this.nom_completo_pastor_bautizo = miembro.nom_completo_pastor_bautizo;
}

Miembro.getAll = resultado => {
  sql.query("select m.id_miembro, m.nombre, m.apellido_paterno, m.apellido_materno, " +
    "m.telefono, m.estado_civil, DATE_FORMAT(m.fecha_nac, '%Y-%m-%d') fecha_nac, " +
    "DATE_FORMAT(m.fecha_conversion, '%Y-%m-%d') fecha_conversion, " +
    "DATE_FORMAT(m.fecha_bautizo, '%Y-%m-%d') fecha_bautizo, " +
    "m.nom_completo_pastor_bautizo, " +

    "ic.id_iglesia_conversion, ic.nombre_iglesia_conv, " +

    "ib.id_iglesia_bautizo, ib.nombre_iglesia_bau, " +

    "cl.id_cargo_lider, cl.nombre_cargo, " +

    "gc.id_gestion_cargo, DATE_FORMAT(gc.fecha_inicio, '%Y-%m-%d') fecha_inicio, DATE_FORMAT(gc.fecha_fin, '%Y-%m-%d') fecha_fin, " +

    "p.id_pastor, p.foto foto_pastor, " +

    "a.id_anciano, a.foto foto_anciano " +

    "from miembro m, iglesia_conversion ic, iglesia_bautizo ib, cargo_lider cl, gestion_cargo gc, pastor p, anciano a " +

    "WHERE m.id_miembro=ic.id_miembro AND " +
    "m.id_miembro = ib.id_miembro AND " +
    "m.id_miembro = cl.id_miembro AND " +
    "m.id_miembro = gc.id_miembro AND " +
    "a.id_miembro = a.id_miembro "

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