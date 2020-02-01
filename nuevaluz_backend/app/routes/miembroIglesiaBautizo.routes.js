module.exports = app => {
    const miembroIglesiaBautizoController = require("../controllers/miembroIglesiaBautizo.controller");
  
    // Crear a un nueva  iglesia_conversion del miembro
    app.post("/miembroIglesiaBautizo", miembroIglesiaBautizoController.createMiembroIglesiaBautizo);
    
  };