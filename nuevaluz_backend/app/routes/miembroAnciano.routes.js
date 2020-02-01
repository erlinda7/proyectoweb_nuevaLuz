module.exports = app => {
    const miembroAncianoController = require("../controllers/miembroAnciano.controller");
  
    // Crear a un nueva  miembro Anciano
    app.post("/miembroAnciano", miembroAncianoController.createMiembroAnciano);
    
  };