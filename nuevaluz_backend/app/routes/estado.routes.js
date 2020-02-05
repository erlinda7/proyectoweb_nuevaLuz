module.exports = app => {
    const estadoController = require("../controllers/estado.controller");
 
    app.put("/estado/:usuarioId", estadoController.update);
  
  };