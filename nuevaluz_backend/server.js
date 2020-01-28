const express = require("express");
const bodyParser = require("body-parser");
const cors = require('cors');

const app = express();

app.use(bodyParser.json());

app.use(cors())


app.use(bodyParser.urlencoded({extended:true}));

//settings
app.set('port', process.env.PORT ||3000);  //si esta definido un puerto que lo tome (jeruko) y sino 3000
app.set('json spaces', 2); 





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













//Starting the server
app.listen(app.get('port'), ()=>{
    console.log(`Server on port ${app.get('port')}`);
    
})