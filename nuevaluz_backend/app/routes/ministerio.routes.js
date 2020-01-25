module.exports = app => {
    const ministerioController = require("../controllers/ministerio.controller"); 

    
    app.get("/ministerio", ministerioController.findAll); 

}
