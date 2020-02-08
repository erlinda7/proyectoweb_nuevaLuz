const postgresSql = require('pg');
const dbConfig = require("../config/db.config.js");


// Create a connection to the database
const connection = new postgresSql.Client({
    host: dbConfig.HOST,
    user: dbConfig.USER,
    password: dbConfig.PASSWORD,
    database: dbConfig.DB
  });
  
  // open the postgresSql connection
  connection.connect(error => {
    if (error) throw error;
    console.log("Correctamente conectado a la base de datos.");
  });
  
  module.exports = connection;