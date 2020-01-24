const sql = require("./db.js");

//constructor
const Evento = function (evento) {
    this.titulo = evento.titulo;
    this.descripcion = evento.descripcion;
    this.lugar = evento.lugar;
    this.fecha = evento.fecha;
    this.imagen = evento.imagen;
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


module.exports = Evento;