module.exports = app => {
    const diaconosController = require("../controllers/diaconos.controller.js"); 


    app.get("/diaconos", diaconosController.findAll);
};