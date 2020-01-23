const pastoresModel =  require("../models/pastores.model.js");

//recuperar la iglesia de la base de datos
exports.findAll = (req, res) =>{
    pastoresModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba pastores"
            });
        }else{
            res.send(data);
        }
    })
}