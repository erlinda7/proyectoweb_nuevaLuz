const sql = require("./db.js");

//constructor
const Tesoreros = function (tesoreros) {
    this.nombre = tesoreros.nombre;
    this.apellido_paterno = tesoreros.apellido_paterno;

}


Tesoreros.getAll = resultado => {       
    sql.query("SELECT nombre, apellido_paterno " +
        "FROM miembro m, cargo_lider c, gestion_cargo g  " +
        "WHERE m.id_miembro = c.id_miembro AND m.id_miembro = g.id_miembro " +
        "AND c.nombre_cargo = 'tesorero' AND  year(g.fecha_fin) = YEAR(NOW())",
        (err, res) => {
            if (err) {
                console.log("Error al recuperar", err);
                resultado(null, err); 
                return;
            }
            console.log("tesorero:", res);
            resultado(null, res);   

        })


}


module.exports = Tesoreros;