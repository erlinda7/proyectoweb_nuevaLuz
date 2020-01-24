const sql = require("./db.js");

//constructor
const ReunionIglesia = function (reunioniglesia) {
    this.titulo = reunioniglesia.titulo;
    this.dia = reunioniglesia.dia;
    this.hora_inicio = reunioniglesia.hora_inicio;
    this.hora_fin = reunioniglesia.hora_fin;
  }

//recuperar reunion_iglesia de la base de datos
ReunionIglesia.getAll = resultado => {        
    sql.query("SELECT id_reunion_iglesia, titulo, dia, time_format(hora_inicio,'%H:%i') as hora_inicio, time_format(hora_fin,'%H:%i') as hora_fin FROM reunion_iglesia", (err, res) => {
      if (err) {
        console.log("Error al recuperar", err);
        resultado(null, err); 
        return;
      }
      console.log("reunion_iglesia: ", res);
      resultado(null, res);  
      
    })
  
    
  }

  module.exports = ReunionIglesia;