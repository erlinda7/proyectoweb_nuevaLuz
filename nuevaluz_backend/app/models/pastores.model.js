const sql = require("./db.js");

//constructor
const Pastores = function (pastores) {
    this.nombre = pastores.nombre;
    this.apellido_paterno = pastores.apellido_paterno;

}

//recuperar pastores de la base de datos
Pastores.getAll = resultado => {       
    sql.query("SELECT nombre, apellido_paterno " +
        "FROM miembro m, cargo_lider c, gestion_cargo g  " +
        "WHERE m.id_miembro = c.id_miembro AND m.id_miembro = g.id_miembro " +
        "AND c.nombre_cargo = 'pastor' AND  year(g.fecha_fin) = YEAR(NOW())",
        (err, res) => {
            if (err) {
                console.log("Error al recuperar", err);
                resultado(null, err); //devuelve hasta el controlador
                return;
            }
            console.log("pastores: ", res);
            resultado(null, res);   //devuelve hasta el controlador

        })


}


module.exports = Pastores;