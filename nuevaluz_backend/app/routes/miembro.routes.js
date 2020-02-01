module.exports = app => {
  const miembroController = require("../controllers/miembro.controller");


  app.get("/miembro", miembroController.findAll);

  // Crear a un nuevo miembro
  app.post("/miembro", miembroController.createMiembro);

  // Modificar miembro por id
  //app.put("/evento/:eventoId", eventoController.update);
  
};