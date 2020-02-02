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


//para modificar y guardar un cargo_lider del miembro por id
exports.update = (req, res) => {
  console.log("req: ", req.body);

  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  miembroCargoLiderModel.updateById(
    req.params.cargoLiderId,
    new miembroCargoLiderModel(req.body),
    (err, data) => {
      if (err) {
        if (err.kind === "no_encontrado") {
          res.status(404).send({
            message: `Cargo_Lider no encontrado con id ${req.params.cargoLiderId}.`
          });
        } else {
          res.status(500).send({
            message: "Error actualizando cargo_lider con id" + req.params.cargoLiderId
          });
        }
      } else res.status(200).json(data);
    }
  );
};
