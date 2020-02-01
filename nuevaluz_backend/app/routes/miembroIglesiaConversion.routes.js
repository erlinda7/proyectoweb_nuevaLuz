module.exports = app => {
    const miembroIglesiaConversionController = require("../controllers/miembroIglesiaConversion.controller");
  
    // Crear a un nueva  iglesia_conversion del miembro
    app.post("/miembroIglesiaConversion", miembroIglesiaConversionController.createMiembroIglesiaConversion);
    
  };