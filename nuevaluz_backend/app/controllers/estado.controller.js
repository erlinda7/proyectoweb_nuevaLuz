const estadoModel = require ("../models/estado.model")


exports.update = (req, res) => {
  console.log("req: ", req.body);

  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  estadoModel.updateById(
    req.params.usuarioId,
    new estadoModel(req.body),
    (err, data) => {
      if (err) {
        if (err.kind === "no_encontrado") {
          res.status(404).send({
            message: `estado del usuario no encontrado con id ${req.params.usuarioId}.`
          });
        } else {
          res.status(500).send({
            message: "Error actualizando estado del usuario con id" + req.params.usuarioId
          });
        }
      } else res.status(200).json(data);
    }
  );
};
