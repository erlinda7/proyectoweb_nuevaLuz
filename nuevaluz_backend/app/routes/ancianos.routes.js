module.exports = app => {
    const pastoresController = require("../controllers/ancianos.controller.js"); 

    app.get("/ancianos", pastoresController.findAll);
};