const sql = require("./db.js");

//constructor
const Ministerio = function (ministerio) {
    this.id_ministerio = ministerio.id_ministerio;
    this.nombre = ministerio.nombre;
    this.descripcion_corta = ministerio.descripcion_corta;
}


Ministerio.getAll = resultado => {
    sql.query("SELECT * FROM ministerio", (err, res) => {
        if (err) {
            console.log("Error al recuperar", err);
            resultado(null, err);
            return;
        }
        console.log("ministerio:", res);
        resultado(null, res);

    })


}


module.exports = Ministerio;