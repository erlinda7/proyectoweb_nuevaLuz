const miembroFotografiaModel = require("../models/miembroFotografia.model");


//para crear y guardar miembro anciano
exports.createMiembroFotografia = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una miembro anciano
  const miembroFotografia = new miembroFotografiaModel({
    foto: req.body.foto,
    id_miembro: req.body.id_miembro
  });

  // guardar miembro anciano en la base de datos
  miembroFotografiaModel.createMiembroFotografia(miembroFotografia, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar la fotografia"
      });
    else res.send(data);
  });
};
