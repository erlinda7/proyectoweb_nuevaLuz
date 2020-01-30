module.exports = app => {

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

  const upload = multer({ storage });




  app.post('/subir', upload.single('file'), (req, res) => {
   // console.log(`Storage location is ${req.hostname}/${req.file.path}`);
    return res.send(req.file);
  });
};