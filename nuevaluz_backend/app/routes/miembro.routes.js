module.exports = app => {
    const miembroController = require("../controllers/miembro.controller"); 


    app.get("/miembro", miembroController.findAll);
};