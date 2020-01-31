const sql = require("./db.js");

//constructor
const Ministerio = function (ministerio) {
    this.id_ministerio = ministerio.id_ministerio;
    this.nombre = ministerio.nombre;
    this.descripcion_corta = ministerio.descripcion_corta;
    this.descripcion = ministerio.descripcion;
    this.lugar = ministerio.lugar;
    this.nombre_responsable = ministerio.nombre_responsable;
    this.email = ministerio.email;
    this.telefono = ministerio.telefono;
    this.foto = ministerio.foto;
    this.imagen = ministerio.imagen;
    this.id_iglesia = ministerio.id_iglesia;
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

//guardando en la bd ministerio
Ministerio.create = (nuevoMinisterio, result) => {
    sql.query("INSERT INTO ministerio SET ?", nuevoMinisterio, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      console.log("ministerio creado: ", { id: res.insertId, ...nuevoMinisterio });
      result(null, { id: res.insertId, ...nuevoMinisterio });
    });
  };


module.exports = Ministerio;