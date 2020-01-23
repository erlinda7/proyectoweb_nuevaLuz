module.exports = app => {
    const tesorerosController = require("../controllers/tesorero.controller"); 


    app.get("/tesoreros", tesorerosController.findAll);
};