const sql = require("./db.js");

//constructor
const Ministerio = function (ministerio) {
  this.id_ministerio = ministerio.id_ministerio;
  this.nombre = ministerio.nombre;
  this.descripcion_corta = ministerio.descripcion_corta;
  this.descripcion = ministerio.descripcion;
  this.lugar = ministerio.lugar;
  this.nombre_responsable = ministerio.nombre_responsable;
  this.email = ministerio.email;
  this.telefono = ministerio.telefono;
  this.foto = ministerio.foto;
  this.imagen = ministerio.imagen;
  this.id_iglesia = ministerio.id_iglesia;
  this.id_reunion_ministerio =ministerio.id_reunion_ministerio;
  this.dia = ministerio.dia;
  this.hora_inicio = ministerio.hora_inicio;
  this.hora_fin = ministerio.hora.fin;
}


Ministerio.getAll = resultado => {
  sql.query(
    "SELECT m.id_ministerio, m.nombre, m.descripcion_corta, m.descripcion, " +
    "m.lugar, m.nombre_responsable, m.email, m.telefono, m.foto, m.imagen, m.id_iglesia, " +

    "rm.id_reunion_ministerio, rm.dia, rm.hora_inicio, rm.hora_fin " +

    "FROM ministerio m, reunion_ministerio rm " +

    "WHERE m.id_ministerio = rm.id_ministerio "
    , (err, res) => {
      if (err) {
        console.log("Error al recuperar", err);
        resultado(null, err);
        return;
      }
      console.log("ministerio:", res);
      resultado(null, res);

    })


}

//guardando en la bd ministerio
Ministerio.create = (nuevoMinisterio, result) => {
  sql.query("INSERT INTO ministerio SET ?", nuevoMinisterio, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("ministerio creado: ", { id: res.insertId, ...nuevoMinisterio });
    result(null, { id: res.insertId, ...nuevoMinisterio });
  });
};


//guardando las modificaciones de ministerio en la base de datos
Ministerio.updateById = (id, ministerio, result) => {
  sql.query(
    "UPDATE ministerio SET nombre = ?, descripcion_corta = ?, descripcion = ?, lugar = ?, nombre_responsable = ?, email = ?, telefono = ?, foto = ?, imagen = ?, id_iglesia = ? WHERE id_ministerio = ?",
    [ministerio.nombre, ministerio.descripcion_corta, ministerio.descripcion, ministerio.lugar, ministerio.nombre_responsable, ministerio.email, ministerio.telefono, ministerio.foto, ministerio.imagen, ministerio.id_iglesia, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // evento no encontrado por id
        result({ kind: "no_encontrado" }, null);
        return;
      }

      console.log("evento actualizado: ", { id: id, ...ministerio });
      result(null, { id: id, ...ministerio });
    }
  );
};


//para eliminar un evento de la bd
Ministerio.remove = (id, result) => {
  sql.query("DELETE FROM ministerio WHERE id_ministerio = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      result({ kind: "no_encontrado" }, null);
      return;
    }

    console.log("ministerio eliminado con id: ", id);
    result(null, res);
  });
};


module.exports = Ministerio;