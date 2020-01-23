const tesoreroModel =  require("../models/tesoreros.model");


exports.findAll = (req, res) =>{
    tesoreroModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba tesoreros"
            });
        }else{
            res.send(data);
        }
    })
}