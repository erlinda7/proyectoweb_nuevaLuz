const ancianosModel =  require("../models/ancianos.model");


exports.findAll = (req, res) =>{
    ancianosModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba ancianos"
            });
        }else{
            res.send(data);
        }
    })
}