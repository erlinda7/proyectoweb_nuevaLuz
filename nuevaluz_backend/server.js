const express = require("express");
const bodyParser = require("body-parser");
const cors = require('cors');
const jwt = require('jsonwebtoken');

const llaveConfig = require("./app/config/llave.config");

const app = express();

const path = require('path');
const multer = require('multer');

let storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, './app/images')
  },
  filename: (req, file, cb) => {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
});

const upload = multer({storage});




//settings
app.set('port', process.env.PORT || 3000);  //si esta definido un puerto que lo tome (jeruko) y sino 3000
app.set('json spaces', 2);


app.use(bodyParser.json());
app.use(cors())
app.use(bodyParser.urlencoded({ extended: true }));


//routes para ejemplo si levante
app.get("/", (req, res) => {
  res.json({ message: "Binvenido a la aplicacion rest api nodejs mysql" });
});


require("./app/routes/iglesia.routes.js")(app);
require("./app/routes/reunion_iglesia.routes.js")(app);

require("./app/routes/directorio.routes.js")(app);

require("./app/routes/evento.routes.js")(app);

require("./app/routes/ministerio.routes.js")(app);

require("./app/routes/liderazgo.routes.js")(app);

require("./app/routes/autenticar.routes.js")(app);


//prueba ruta protegida
require("./app/routes/pruebaRutaProtegida.routes.js")(app);



//----funcion para subir post
app.post('/subir', upload.single('file'), (req, res) => {
  console.log(`Storage location is ${req.hostname}/${req.file.path}`);
  return res.send(req.file);
})
///--






//Starting the server
app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);

})