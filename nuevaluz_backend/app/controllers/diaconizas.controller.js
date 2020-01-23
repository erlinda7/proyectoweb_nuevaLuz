const diaconizasModel =  require("../models/diaconizas.model");


exports.findAll = (req, res) =>{
    diaconizasModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba diaconizas"
            });
        }else{
            res.send(data);
        }
    })
}