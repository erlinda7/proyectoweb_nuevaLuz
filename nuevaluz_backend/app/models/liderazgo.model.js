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
        "(SELECT nombre, apellido_paterno, p.foto, c.nombre_cargo "+
            "FROM miembro m, pastor p, cargo_lider c "+
            "WHERE  m.id_miembro=p.id_miembro AND m.id_miembro=c.id_miembro ) "+
            " UNION"+
            "(SELECT nombre, apellido_paterno, a.foto, c.nombre_cargo "+
            "FROM miembro m, anciano a, cargo_lider c "+
            "WHERE  m.id_miembro=a.id_miembro AND m.id_miembro=c.id_miembro ) "
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