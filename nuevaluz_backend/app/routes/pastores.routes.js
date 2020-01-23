module.exports = app => {
    const pastoresController = require("../controllers/pastores.controller.js"); 

    //recuperar pastores de la base de datos
    app.get("/pastores", pastoresController.findAll);
};