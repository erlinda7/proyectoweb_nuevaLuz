module.exports = app => {
  const eventoController = require("../controllers/evento.controller");


  app.get("/evento", eventoController.findAll);

  // Create a un nuevo evento
  app.post("/evento", eventoController.create);

}
