module.exports = app => {
    const miembroPastorController = require("../controllers/miembroPastor.controller");
  
    // Crear a un nueva  miembro Pastor
    app.post("/miembroPastor", miembroPastorController.createMiembroPastor);
    
  };