module.exports = app => {
  const ministerioController = require("../controllers/ministerio.controller");


  app.get("/ministerio", ministerioController.findAll);

  // Create a un nuevo ministerio
  app.post("/ministerio", ministerioController.create);

  // Modificar ministerio por id
  app.put("/ministerio/:ministerioId", ministerioController.update);

}
