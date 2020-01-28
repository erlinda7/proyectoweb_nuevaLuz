const express = require("express");
const jwt = require('jsonwebtoken');
const llaveConfig = require("../config/llave.config");
const app = express();

app.set('llave', llaveConfig.llave);



const rutasProtegidas = express.Router();

var verificarToken = rutasProtegidas.use((req, res, next) => {
    const token = req.headers['access-token'];

    if (token) {
        jwt.verify(token, app.get('llave'), (err, decoded) => {
            if (err) {
                return res.json({ mensaje: 'Token inválida' });
            } else {
                req.decoded = decoded;
                next();
            }
        });
    } else {
        res.send({
            mensaje: 'Token no proveída.'
        });
    }
});

module.exports = verificarToken;