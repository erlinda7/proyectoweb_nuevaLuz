const diaconosModel =  require("../models/diaconos.model");


exports.findAll = (req, res) =>{
    diaconosModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba diaconos"
            });
        }else{
            res.send(data);
        }
    })
}