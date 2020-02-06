const sql = require("./db.js");

// constructor
const Usuario = function (usuario) {
  this.id_usuario = usuario.id_usuario;
  this.nombre_user = usuario.nombre_user;
  this.contrasenia = usuario.contrasenia;
};


Usuario.getUsuario = (nombreUsuario, result) => {
  sql.query(`SELECT * FROM usuario WHERE nombre_user = "${nombreUsuario}"`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    if (res.length) {
      result(null, res[0]);
      return;
    }
    result({ kind: "no encontrado" }, null);
  });
};

module.exports = Usuario;
