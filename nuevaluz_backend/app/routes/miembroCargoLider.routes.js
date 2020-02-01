module.exports = app => {
    const miembroCargoLiderController = require("../controllers/miembroCargoLider.controller");
  
    // Crear a un nueva  cargo_lider del miembro
    app.post("/miembroCargoLider", miembroCargoLiderController.createMiembroCargoLider);
    
  };