const miembroGestionCargoModel = require("../models/miembroGestionCargo.model");


//para crear y guardar gestion_cargo del miembro
exports.createMiembroGestionCargo = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una gestion_cargo del miembro
  const miembroGestionCargo = new miembroGestionCargoModel({
    fecha_inicio : req.body.fecha_inicio,
    fecha_fin : req.body.fecha_fin,
    id_miembro: req.body.id_miembro
  });

  // guardar gestion_cargo del miembro en la base de datos
  miembroGestionCargoModel.createMiembroGestionCargo(miembroGestionCargo, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar un gestion_cargo"
      });
    else res.send(data);
  });
};
