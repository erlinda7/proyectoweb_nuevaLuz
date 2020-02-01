const miembroAncianoModel = require("../models/miembroAnciano.model");


//para crear y guardar miembro anciano
exports.createMiembroAnciano = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una miembro anciano
  const miembroAnciano = new miembroAncianoModel({
    foto : req.body.foto,
    id_miembro: req.body.id_miembro
  });

  // guardar miembro anciano en la base de datos
  miembroAncianoModel.createMiembroAnciano(miembroAnciano, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar un miembro anciano"
      });
    else res.send(data);
  });
};
