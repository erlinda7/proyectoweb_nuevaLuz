module.exports = app => {
  const miembroController = require("../controllers/miembro.controller");


  app.get("/miembro", miembroController.findAll);

  // Crear a un nuevo miembro
  app.post("/miembro", miembroController.createMiembro);
  
};