module.exports = app => {
  const autenticarController = require("../controllers/autenticar.controller");

  // Create a new Customer
  app.post("/autenticar", autenticarController.create);
};