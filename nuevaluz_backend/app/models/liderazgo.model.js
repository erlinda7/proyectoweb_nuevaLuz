const sql = require("./db.js");

//constructor
const Liderazgo = function (liderazgo) {
    this.nombre = liderazgo.nombre;
    this.apellido_paterno = liderazgo.apellido_paterno;
    this.nombre_cargo = liderazgo.nombre_cargo;
    this.foto = liderazgo.foto;
}


Liderazgo.getAll = resultado => {       
    sql.query(
        "SELECT m.nombre, m.apellido_paterno, f.foto, c.nombre_cargo "+
        "FROM miembro m, fotografia f, cargo_lider c, gestion_cargo g "+
        "WHERE  m.id_miembro=f.id_miembro AND "+
        "m.id_miembro=c.id_miembro AND "+
        "m.id_miembro=g.id_miembro AND "+
        //pendiente getion actual
        "year(g.fecha_fin) = YEAR(NOW())"
        ,
        (err, res) => {
            if (err) {
                console.log("Error al recuperar", err);
                resultado(null, err); 
                return;
            }
            console.log("directorio:", res);
            resultado(null, res);   

        })


}


module.exports = Liderazgo;