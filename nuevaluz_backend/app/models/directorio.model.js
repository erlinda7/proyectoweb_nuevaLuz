const sql = require("./db.js");

//constructor
const Directorio = function (directorio) {
    this.nombre = directorio.nombre;
    this.apellido_paterno = directorio.apellido_paterno;
    this.nombre_cargo = directorio.nombre_cargo;

}


Directorio.getAll = resultado => {       
    sql.query("SELECT nombre, apellido_paterno, nombre_cargo " +
        "FROM miembro m, cargo_lider c, gestion_cargo g  " +
        "WHERE m.id_miembro = c.id_miembro AND m.id_miembro = g.id_miembro " +
        "AND (c.nombre_cargo = 'pastor' OR c.nombre_cargo = 'anciano' OR c.nombre_cargo = 'diacono' "+ 
        "OR c.nombre_cargo = 'diaconiza' OR c.nombre_cargo = 'tesorero' OR c.nombre_cargo = 'secretario' OR c.nombre_cargo = 'superintendente')"+
        "AND  year(g.fecha_fin) = YEAR(NOW())",
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


module.exports = Directorio;