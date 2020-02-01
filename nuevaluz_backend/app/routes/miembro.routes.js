module.exports = app => {
  const miembroController = require("../controllers/miembro.controller");


  app.get("/miembro", miembroController.findAll);

  // inicio Crear a un nuevo miembro
  app.post("/miembro", miembroController.createMiembro);
  //app.post("/miembroIglesiaConversion",miembroController.createMiembroIglesiaConversion);
  //fin crear un nuevo miembro
};