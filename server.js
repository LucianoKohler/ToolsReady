const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use('/assets', express.static('assets'))
app.use('/css', express.static('css'))
app.use('/js', express.static('js'))
app.use('/pages', express.static('pages'))
app.use('/', express.static('/'))

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'toolsready',
});

connection.connect(function (err) {
  if (!err){
    console.log("Conexão como o Banco realizada com sucesso!!!");
  } else{
    console.log("Erro: Conexão NÃO realizada", err);
  }
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
})
 
app.post('/pages/finalizarcadastro', (req, res) => {
  // let nome = req.body.nome;
  // let cpf = req.body.cpf;
  // let nascimento = req.body.nascimento;
  // let email = req.body.email;
  // let senha = req.body.senha;
  // let confirmasenha = req.body.confirmasenha;
  let data1 = req.body;
  console.log(JSON.stringify(data1))
  res.redirect('/pages/finalizarcadastro.html');
})

app.post('/pages/fimcadastro', (req, res) => {

  let data2 = req.body;
  console.log(JSON.stringify(data2))
  res.redirect('/pages/fimcadastro.html');
})

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!')
})
