const sql = require("./db.js");

//constructor
const Usuario = function (usuario) {
  this.id_usuario = usuario.id_usuario;
  this.nombre_user = usuario.nombre_user;
  this.contrasenia = usuario.contrasenia;
}


Usuario.findById = (usuarioId, result) => {
    sql.query(`SELECT  id_usuario, nombre_user FROM usuario WHERE id_usuario > ${usuarioId}`, (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      if (res.length) {
        console.log("found usuario: ", res);
        result(null, res);
        return;
      }
  
      // not found Customer with the id
      result(null, res);
    });
  };

//guardando en la bd evento
Usuario.create = (nuevoUsuario, result) => {
  sql.query("INSERT INTO usuario SET ?", nuevoUsuario, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("usuario creado: ", { id: res.insertId, ...nuevoUsuario });
    result(null, { id: res.insertId, ...nuevoUsuario });
  });
};



//para eliminar un evento de la bd
Usuario.remove = (id, result) => {
  sql.query("DELETE FROM usuario WHERE id_usuario = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Customer with the id
      result({ kind: "no_encontrado" }, null);
      return;
    }

    console.log("usuario eliminado con id: ", id);
    result(null, res);
  });
};



module.exports = Usuario;