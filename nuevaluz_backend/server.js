const express = require("express");
const bodyParser = require("body-parser");
var cors = require('cors')

const app = express();

app.use(bodyParser.json());

app.use(cors())

app.use(bodyParser.urlencoded({extended:true}));

//settings
app.set('port', process.env.PORT ||8080);  //si esta definido un puerto que lo tome (jeruko) y sino 3000
app.set('json spaces', 2); 




//routes para ejemplo si levante
app.get("/", (req, res) => {
    res.json({ message: "Binvenido a la aplicacion rest api nodejs mysql" });
});


require("./app/routes/iglesia.routes.js")(app);
require("./app/routes/reunion_iglesia.routes.js")(app);

//para vista directorio
require("./app/routes/pastores.routes.js")(app);
require("./app/routes/ancianos.routes.js")(app);
require("./app/routes/diaconos.routes.js")(app);
require("./app/routes/diaconizas.routes.js")(app);



//Starting the server
app.listen(app.get('port'), ()=>{
    console.log(`Server on port ${app.get('port')}`);
    
})