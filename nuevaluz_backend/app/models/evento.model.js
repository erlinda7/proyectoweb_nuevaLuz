const sql = require("./db.js");

//constructor
const Evento = function (evento) {
    this.titulo = evento.titulo;
    this.descripcion = evento.descripcion;
    this.lugar = evento.lugar;
    this.fecha = evento.fecha;
    this.imagen = evento.imagen;
    this.id_iglesia = evento.id_iglesia;
}


Evento.getAll = resultado => {
    sql.query("SELECT titulo, descripcion, lugar, DATE_FORMAT(fecha, '%d - %m - %Y') fecha, imagen FROM evento", (err, res) => {
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



module.exports = Evento;