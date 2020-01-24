const eventoModel =  require("../models/evento.model");


exports.findAll = (req, res) =>{
    eventoModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba evento"
            });
        }else{
            res.send(data);
        }
    })
}