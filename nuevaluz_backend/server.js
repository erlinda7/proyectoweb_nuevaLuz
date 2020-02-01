const express = require("express");
const bodyParser = require("body-parser");
const cors = require('cors');
const jwt = require('jsonwebtoken');

const llaveConfig = require("./app/config/llave.config");

const app = express();




//settings
app.set('port', process.env.PORT ||3000);  //si esta definido un puerto que lo tome (jeruko) y sino 3000
app.set('json spaces', 2); 


app.use(bodyParser.json());
app.use(cors())
app.use(bodyParser.urlencoded({extended:true}));

app.use(express.static('app'))
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

require("./app/routes/miembro.routes.js")(app);

require("./app/routes/miembroIglesiaConversion.routes")(app);  //iglesia conversion del miembro
require("./app/routes/miembroIglesiaBautizo.routes")(app);  //iglesia bautizo del miembro


//prueba ruta protegida
require("./app/routes/pruebaRutaProtegida.routes.js")(app);



//ruta para subir imagenes
require("./app/routes/subir.routes.js")(app);

//ruta para eliminar imagenes
//require("./app/routes/eliminar.routes.js")(app);

//Starting the server
app.listen(app.get('port'), ()=>{
    console.log(`Server on port ${app.get('port')}`);
    
})