//const autenticarModel = require("../models/autenticar.model");
const express = require("express");
const jwt = require('jsonwebtoken');
const llaveConfig = require("../config/llave.config");
const app2 = express();

app2.set('llave', llaveConfig.llave);



exports.autenticar = (req, res) => {

  if (!req.body) {
    res.status(400).send({
      message: "El contenido no puede ser vacio!"
    });
  }

  if (req.body.nombre_user == "juan" && req.body.contrasenia == "12345") {
    const payload = {
      check: true
    };
    const token = jwt.sign(payload, app2.get('llave'), {
      expiresIn: 1440
     });
     res.json({
      mensaje: 'Autenticación correcta',
      token: token
     });

  } else {
    res.json({ mensaje: "Usuario o contraseña incorrectos" })
  }





};


