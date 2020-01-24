module.exports = app => {
    const eventoController = require("../controllers/evento.controller"); 

    
    app.get("/evento", eventoController.findAll); 

}
