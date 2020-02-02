module.exports = app => {
  const miembroController = require("../controllers/miembro.controller");

  // Crear a un nuevo miembro
  app.post("/miembro", miembroController.createMiembro);


  
};