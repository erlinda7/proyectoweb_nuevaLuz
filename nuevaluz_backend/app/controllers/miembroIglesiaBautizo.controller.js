const miembroIglesiaBautizoModel = require("../models/miembroIglesiaBautizo.model");


//para crear y guardar iglesia de conversion del miembro
exports.createMiembroIglesiaBautizo = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear una Iglesia_bautizo
  const miembroIglesiaBautizo = new miembroIglesiaBautizoModel({
    nombre_iglesia_bau : req.body.nombre_iglesia_bau,
    id_miembro: req.body.id_miembro
  });

  // guardar iglesia_bautizo en la base de datos
  miembroIglesiaBautizoModel.createMiembroIglesiaBautizo(miembroIglesiaBautizo, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar la iglesia bautizo del miembro"
      });
    else res.send(data);
  });
};
