const sql = require("./db.js");

// constructor
const Autenticar = function(autenticar) {
  this.usuario = autenticar.usuario;
  this.contrasenia = autenticar.contrasenia;
};

Autenticar.create = (newAutenticar, result) => {
  sql.query("INSERT INTO usuario SET ?", newAutenticar, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created Autenticado: ", { id: res.insertId, ...newAutenticar });
    result(null, { id: res.insertId, ...newAutenticar });
  });
};

module.exports = Autenticar;





 