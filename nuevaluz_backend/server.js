const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({extended:true}));

//settings
app.set('port', process.env.PORT ||8080);  //si esta definido un puerto que lo tome (jeruko) y sino 3000





//routes para ejemplo si levante
app.get("/", (req, res) => {
    res.json({ message: "Binvenido a la aplicacion rest api nodejs mysql" });
});


require("./app/routes/iglesia.routes.js")(app);



//Starting the server
app.listen(app.get('port'), ()=>{
    console.log(`Server on port ${app.get('port')}`);
    
})