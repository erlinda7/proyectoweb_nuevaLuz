module.exports = app => {
    const miembroFotografiaController = require("../controllers/miembroFotografia.controller");
  
    // Crear a un nueva  Fotografia del miembro
    app.post("/miembroFotografia", miembroFotografiaController.createMiembroFotografia);
    
  };