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
  password: '', //Se der access denied, mudar para 'root'
  database: 'toolsready',
  port: '3306', //Dependendo da porta do Xampp, mudar
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

//PARA LOGIN
app.post('/login', (req, res) => {
  let email = req.body.email;
  let senha = req.body.senha;

  connection.query("SELECT * FROM cliente where email = '" + email +"'", function (err, rows) {
    if (!err && rows.length >=1){
      console.log("Resultado:",rows);
      
      if (senha === rows[0].senha ){
        console.log('Senha OK');
        res.redirect('../#auth=true');
      }else{
        console.log('Senha errada');
        res.redirect('/pages/login.html#P_Err')
      }
    } else{
      console.log("Erro: Consulta não realizada", err); res.redirect('/pages/login.html#E_Err')}
    });
})
 

//PARA CADASTRO PF
app.post('/pages/finalizarcadastroPF', (req, res) => {
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

//Código para validar um cupom na página de perfil
app.post('/pages/perfil/', (req, res) => {
  let cupom = req.body.cupom;
  let status = false;
  connection.query("SELECT * FROM cupom WHERE codigo_promocional = ?;", [cupom], function (err, rows){
    if(err) throw err;

    if(rows.length>=1 && rows[0].resgatado == 0){
      connection.query("UPDATE cupom SET resgatado = '1' WHERE codigo_promocional = ?", [cupom])
      status = true;
    }
    res.redirect('/pages/perfil.html#coupom=' + status);
  })
})

//Para validar cupom no carrinho
app.post('/pages/carrinho/', (req, res) => {
  let cupom = req.body.cupom;
  let status = false;

  connection.query("SELECT * FROM cupom WHERE codigo_promocional = ?;", [cupom], function (err, rows){
    if(err) throw err;

    if(rows.length>=1 && rows[0].resgatado == 0){
      connection.query("UPDATE cupom SET resgatado = '1' WHERE codigo_promocional = ?", [cupom]);
      status = true;
    }
    res.redirect('/pages/carrinho.html#coupom=' + status);
  })
})

//Para validar cupom no confirmar pedido
app.post('/pages/confirmarpedido/', (req, res) => {
  let cupom = req.body.cupom;
  let status = false;
  connection.query("SELECT * FROM cupom WHERE codigo_promocional = ?;", [cupom], function (err, rows){
    if(err) throw err;

    if(rows.length>=1 && rows[0].resgatado == 0){
      connection.query("UPDATE cupom SET resgatado = '1' WHERE codigo_promocional = ?", [cupom])
      status = true;
    }
    res.redirect('/pages/confirmarpedido.html#coupom=' + status);
  })
})

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!')
})
