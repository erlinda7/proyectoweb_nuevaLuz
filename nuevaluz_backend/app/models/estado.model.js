const sql = require("./db.js");

//constructor
const EstadoUsuario = function (estadoUsuario) {
  this.estado= estadoUsuario.estado;
}


EstadoUsuario.updateById = (id, estadoUsuario, result) => {
  sql.query(
    "UPDATE usuario SET estado= ? WHERE id_usuario = ? ", [estadoUsuario.estado, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        result({ kind: "no_encontrado" }, null);
        return;
      }

      console.log("estado actualizado: ", { id: id, ...estadoUsuario });
      result(null, { id: id, ...estadoUsuario });
    }
  );
};


module.exports = EstadoUsuario;