const miembroModel = require("../models/miembro.model");


//para crear y guardar nuevo miembro
exports.createMiembro = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "El contenido del body no puede ser vacio!"
    });
  }

  // Crear un Miembro
  const miembro = new miembroModel({
    nombre : req.body.nombre,
    apellido_paterno: req.body.apellido_paterno,
    apellido_materno: req.body.apellido_materno,
    telefono: req.body.telefono,
    estado_civil: req.body.estado_civil,
    fecha_nac: req.body.fecha_nac,
    fecha_conversion: req.body.fecha_conversion,
    iglesia_conversion: req.body.iglesia_conversion,
    fecha_bautizo: req.body.fecha_bautizo,
    iglesia_bautizo: req.body.iglesia_bautizo,
    nom_completo_pastor_bautizo: req.body.nom_completo_pastor_bautizo,
  });

  // guardar miembro en la base de datos
  miembroModel.createMiembro(miembro, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Ha ocurrido un error al guardar el miembro"
      });
    else res.send(data);
  });
};




