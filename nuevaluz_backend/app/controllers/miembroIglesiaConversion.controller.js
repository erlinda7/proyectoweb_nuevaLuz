const miembroIglesiaConversionModel = require("../models/miembroIglesiaConversion.model");


//para crear y guardar iglesia de conversion del miembro
exports.createMiembroIglesiaConversion = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una Iglesia_conversion
  const miembroIglesiaConversion = new miembroIglesiaConversionModel({
    nombre_iglesia_conv : req.body.nombre_iglesia_conv,
    id_miembro: req.body.id_miembro
  });

  // guardar iglesia_conversion en la base de datos
  miembroIglesiaConversionModel.createMiembroIglesiaConversion(miembroIglesiaConversion, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar la iglesia conversion del miembro"
      });
    else res.send(data);
  });
};
