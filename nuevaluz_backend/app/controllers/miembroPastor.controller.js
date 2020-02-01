const miembroPastorModel = require("../models/miembroPastor.model");


//para crear y guardar miembro anciano
exports.createMiembroPastor = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una miembro pastor
  const miembroPastor = new miembroPastorModel({
    foto : req.body.foto,
    id_miembro: req.body.id_miembro
  });

  // guardar miembro pastor en la base de datos
  miembroPastorModel.createMiembroPastor(miembroPastor, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar un miembro pastor"
      });
    else res.send(data);
  });
};
