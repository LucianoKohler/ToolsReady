// get the client
const mysql = require('mysql2');

// create the connection to database
const connection = mysql.createConnection({
   host: '127.0.0.1',
   user: 'root',
   password: 'root',
   database: 'toolsready'
 });

 connection.connect(function (err) {
   console.log("Conexão como o Banco realizada com sucesso!!!")
 });

 connection.query("SELECT * FROM teste", function (err, rows, fields) {
   if (!err){
       console.log("Resultado:",rows );
   } else{
       console.log("Erro: Consulta não realizada", err);
   }
 });
