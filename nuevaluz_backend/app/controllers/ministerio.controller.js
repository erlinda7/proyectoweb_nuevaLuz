const ministerioModel =  require("../models/ministerio.model");


exports.findAll = (req, res) =>{
    ministerioModel.getAll((err, data) =>{
        if(err){
            res.status(500).send({
                message:
                    err.message || "Ha ocurrido un error mientras recuperaba ministerio"
            });
        }else{
            res.send(data);
        }
    })
}