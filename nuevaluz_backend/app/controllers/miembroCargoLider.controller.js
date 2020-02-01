const miembroCargoLiderModel = require("../models/miembroCargoLider.model");


//para crear y guardar cargo_lider del miembro
exports.createMiembroCargoLider = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una cargo_lider del miembro
  const miembroCargoLider = new miembroCargoLiderModel({
    nombre_cargo : req.body.nombre_cargo,
    id_miembro: req.body.id_miembro
  });

  // guardar cargo_lider del miembro en la base de datos
  miembroCargoLiderModel.createMiembroCargoLider(miembroCargoLider, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar un cargo_lider "
      });
    else res.send(data);
  });
};
