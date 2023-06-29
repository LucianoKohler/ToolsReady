const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const req = require('express/lib/request');
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

var PFsql = `INSERT INTO cliente
            (tipo_pessoa, CPF_CNPJ, nascimento_fundacao, nome, numero_telefone, senha, email)
            VALUES
            (?, ?, ?, ?, ?, ?, ?)`;

var PJsql = `INSERT INTO cliente
            (tipo_pessoa, CPF_CNPJ, nascimento_fundacao, nome, numero_telefone, senha, inf_tributarias, razao_social, inscricao_estadual, responsavel_compra, email)
            VALUES
            (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;



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
 
app.post('/pages/finalizarcadastroPF', (req, res) => {
  // let nome = req.body.nome;
  // let cpf = req.body.cpf;
  // let nascimento = req.body.nascimento;
  // let email = req.body.email;
  // let senha = req.body.senha;
  // let confirmasenha = req.body.confirmasenha;
  let nome = req.body.nome;
  let CPF = req.body.cpf;
  let nascimento = req.body.nascimento;
  let telefone = req.body.telefone;
  let email = req.body.email;
  let senha = req.body.senha;

  res.redirect('/pages/finalizarcadastro.html');

  app.post('/pages/fimcadastro', (req, res) => {

    let metodo = req.body.metodo; //Não usado no banco
    
    connection.query(PFsql, ['fisica', CPF, nascimento, nome, telefone, senha, email]);
    res.redirect('/pages/fimcadastro.html');
  })
})

app.post('/pages/finalizarcadastroPJ', (req, res) => {
  let nome = req.body.nome;
  let CNPJ = req.body.cnpj;
  let abertura = req.body.abertura;
  let razao = req.body.razao;
  let info = req.body.info;
  let inscricao = req.body.inscricao;
  let nome_compra = req.body.nome_compra;
  let telefone = req.body.telefone;
  let email = req.body.email;
  let senha = req.body.senha;

  res.redirect('/pages/finalizarcadastro.html');

  app.post('/pages/fimcadastro', (req, res) => {

    let metodo = req.body.metodo; //Não usado no banco
    
    connection.query(PJsql, ['juridica', CNPJ, abertura, nome, telefone, senha, info, razao, inscricao, nome_compra, email]);
    res.redirect('/pages/fimcadastro.html');
  })
})

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!')
})
