// module.exports = app => {
  const fs = require('fs');
  
  //app.get("/eliminar",
    fs.unlink('anciano1.png', (error) => {
      if (error) {
        throw error;
      }
      console.log('el archivo a sido eliminado');

    })
 // );
//};