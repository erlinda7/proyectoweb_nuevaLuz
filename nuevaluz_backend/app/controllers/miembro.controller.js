const miembroModel = require("../models/miembro.model");


exports.findAll = (req, res) => {
  miembroModel.getAll((err, data) => {
    if (err) {
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error mientras recuperaba miembros"
      });
    } else {
      res.send(data);
    }
  })
}