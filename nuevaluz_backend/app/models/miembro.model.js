const sql = require("./db.js");

//constructor
const Miembro = function (miembro) {
  this.nombre = miembro.nombre;

}

Miembro.getAll = resultado => {
  sql.query("select m.id_miembro, m.nombre, m.apellido_paterno, m.apellido_materno, "+
    "m.telefono, m.estado_civil, DATE_FORMAT(m.fecha_nac, '%Y-%m-%d') fecha_nac, "+
    "DATE_FORMAT(m.fecha_conversion, '%Y-%m-%d') fecha_conversion, "+
    "DATE_FORMAT(m.fecha_bautizo, '%Y-%m-%d') fecha_bautizo, "+
    "m.nom_completo_pastor_bautizo, "+
    
    "ic.id_iglesia_conversion, ic.nombre_iglesia_conv, "+
    
    "ib.id_iglesia_bautizo, ib.nombre_iglesia_bau, "+
    
    "cl.id_cargo_lider, cl.nombre_cargo, "+
    
    "gc.id_gestion_cargo, gc.fecha_inicio, gc.fecha_fin, "+
    
    "p.id_pastor, p.biografia, p.mensaje, p.versiculo, p.foto foto_pastor, "+
    
    "a.id_anciano, a.foto foto_anciano "+
    
    "from miembro m, iglesia_conversion ic, iglesia_bautizo ib, cargo_lider cl, gestion_cargo gc, pastor p, anciano a "+
    
    "WHERE m.id_miembro=ic.id_miembro AND "+
    "m.id_miembro = ib.id_miembro AND "+
    "m.id_miembro = cl.id_miembro AND "+
    "m.id_miembro = gc.id_miembro AND "+
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


module.exports = Miembro;