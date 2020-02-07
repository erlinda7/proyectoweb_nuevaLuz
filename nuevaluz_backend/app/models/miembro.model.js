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
  this.id_cargo_lider = miembro.id_cargo_lider;
}


//guardando en la bd miembro en la tabla miembro
Miembro.createMiembro = (nuevoMiembro, result) => {
  sql.query("INSERT INTO miembro SET ?", nuevoMiembro, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("miembro creado : ", { id: res.insertId, ...nuevoMiembro });
    result(null, { id: res.insertId, ...nuevoMiembro });
  });



};


//guradando las modificaciones de miembro en la base de datos
Miembro.updateById = (id, miembro, result) => {
  sql.query(
    "UPDATE miembro SET nombre = ?, apellido_paterno = ?, apellido_materno = ?, " +
    "telefono= ?, estado_civil = ?, fecha_nac = ?, fecha_conversion = ?, iglesia_conversion = ?, " +
    "fecha_bautizo = ?, iglesia_bautizo = ?, nom_completo_pastor_bautizo = ?, id_cargo_lider = ? WHERE id_miembro = ?",
    [miembro.nombre, miembro.apellido_paterno, miembro.apellido_materno,
    miembro.telefono, miembro.estado_civil, miembro.fecha_nac, miembro.fecha_conversion,
    miembro.iglesia_conversion, miembro.fecha_bautizo, miembro.iglesia_bautizo, miembro.nom_completo_pastor_bautizo, miembro.id_cargo_lider, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        result({ kind: "no_encontrado" }, null);
        return;
      }

      console.log("miembro actualizado: ", { id: id, ...miembro });
      result(null, { id: id, ...miembro });
    }
  );
};

//para eliminar un miembro de la bd
Miembro.remove = (id, result) => {
  sql.query("DELETE FROM miembro WHERE id_miembro = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Customer with the id
      result({ kind: "no_encontrado" }, null);
      return;
    }

    console.log("miembro eliminado con id: ", id);
    result(null, res);
  });
};


module.exports = Miembro;