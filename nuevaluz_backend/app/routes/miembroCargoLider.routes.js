module.exports = app => {
  const miembroCargoLiderController = require("../controllers/miembroCargoLider.controller");

  // Crear a un nueva  cargo_lider del miembro
  app.post("/miembroCargoLider", miembroCargoLiderController.createMiembroCargoLider);

  // Modificar cargo_lider del miembro por id
  app.put("/miembroCargoLider/:cargoLiderId", miembroCargoLiderController.update);

};