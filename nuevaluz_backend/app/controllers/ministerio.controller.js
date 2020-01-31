const ministerioModel = require("../models/ministerio.model");


exports.findAll = (req, res) => {
  ministerioModel.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error mientras recuperaba ministerio"
      });
    } else {
      res.send(data);
    }
  })
}

//-------para crear y guardar nuevo ministerio
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!!"
    });
  }

  // Crear un Ministerio
  const ministerio = new ministerioModel({
    nombre: req.body.nombre,
    descripcion_corta: req.body.descripcion_corta,
    descripcion: req.body.descripcion,
    lugar: req.body.lugar,
    nombre_responsable: req.body.nombre_responsable,
    email: req.body.email,
    telefono: req.body.telefono,
    foto: req.body.foto,
    imagen: req.body.imagen,
    id_iglesia: req.body.id_iglesia
    });

  // guardar evento en la base de datos
  ministerioModel.create(ministerio, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar el ministerio"
      });
    else res.send(data);
  });
};
