module.exports = app => {
  const miembroController = require("../controllers/miembro.controller");

  // Crear a un nuevo miembro
  app.post("/miembro", miembroController.createMiembro);

  // Modificar miembro por id
  app.put("/miembro/:miembroId", miembroController.update);

};