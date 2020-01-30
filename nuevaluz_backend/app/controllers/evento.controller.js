const eventoModel = require("../models/evento.model");


exports.findAll = (req, res) => {
  eventoModel.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error mientras recuperaba evento"
      });
    } else {
      res.send(data);
    }
  })
}


//-------para crear y guardar nuevo evento
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  // Crear un Evento
  const evento = new eventoModel({
    titulo: req.body.titulo,
    descripcion: req.body.descripcion,
    lugar: req.body.lugar,
    fecha: req.body.fecha,
    imagen: req.body.imagen,
    id_iglesia: req.body.id_iglesia
  });

  // guardar evento en la base de datos
  eventoModel.create(evento, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar el evento"
      });
    else res.send(data);
  });
};