module.exports = app => {
    const diaconizasController = require("../controllers/diaconizas.controller"); 


    app.get("/diaconizas", diaconizasController.findAll);
};