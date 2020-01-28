const AutenticarModel = require("../models/autenticar.model");

// Create and Save a new Customer
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "El contenido no puede ser vacio!"
    });
  }

  // Create a Customer
  const autenticarModel = new AutenticarModel({
    usuario: req.body.usuario,
    contrasenia: req.body.contrasenia
  });

  // Save Customer in the database
  AutenticarModel.create(autenticarModel, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ocurrio un error mientras se creaba autentificacion."
      });
    else res.send(data);
  });
};