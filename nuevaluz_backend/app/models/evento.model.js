const sql = require("./db.js");

//constructor
const Evento = function (evento) {
  this.id_evento = evento.id_evento;
  this.titulo = evento.titulo;
  this.descripcion = evento.descripcion;
  this.lugar = evento.lugar;
  this.fecha = evento.fecha;
  this.imagen = evento.imagen;
  this.id_iglesia = evento.id_iglesia;
}


Evento.getAll = resultado => {
  sql.query("SELECT id_evento, titulo, descripcion, lugar, DATE_FORMAT(fecha, '%d-%m-%Y') fecha, imagen FROM evento", (err, res) => {
    if (err) {
      console.log("Error al recuperar", err);
      resultado(null, err);
      return;
    }
    console.log("evento:", res);
    resultado(null, res);

  })


}

//guardando en la bd evento
Evento.create = (nuevoEvento, result) => {
  sql.query("INSERT INTO evento SET ?", nuevoEvento, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("evento creado: ", { id: res.insertId, ...nuevoEvento });
    result(null, { id: res.insertId, ...nuevoEvento });
  });
};


//guradando las modificaciones de evento en la base de datos
Evento.updateById = (id, evento, result) => {
  //console.log(id,"id llegando");

  sql.query(
    "UPDATE evento SET titulo = ?, descripcion = ?, lugar = ?, fecha= ?, imagen = ?, id_iglesia = ? WHERE id_evento = ?",
    [evento.titulo, evento.descripcion, evento.lugar, evento.fecha, evento.imagen, evento.id_iglesia, id],
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

      console.log("evento actualizado: ", { id: id, ...evento });
      result(null, { id: id, ...evento });
    }
  );
};

//para eliminar un evento de la bd
Evento.remove = (id, result) => {
  sql.query("DELETE FROM evento WHERE id_evento = ?", id, (err, res) => {
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

    console.log("evento eliminado con id: ", id);
    result(null, res);
  });
};



module.exports = Evento;