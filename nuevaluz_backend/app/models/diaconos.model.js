const sql = require("./db.js");

//constructor
const Diaconos = function (diaconos) {
    this.nombre = diaconos.nombre;
    this.apellido_paterno = diaconos.apellido_paterno;

}


Diaconos.getAll = resultado => {       
    sql.query("SELECT nombre, apellido_paterno " +
        "FROM miembro m, cargo_lider c, gestion_cargo g  " +
        "WHERE m.id_miembro = c.id_miembro AND m.id_miembro = g.id_miembro " +
        "AND c.nombre_cargo = 'diacono' AND  year(g.fecha_fin) = YEAR(NOW())",
        (err, res) => {
            if (err) {
                console.log("Error al recuperar", err);
                resultado(null, err); 
                return;
            }
            console.log("diaconos: ", res);
            resultado(null, res);   

        })


}


module.exports = Diaconos;