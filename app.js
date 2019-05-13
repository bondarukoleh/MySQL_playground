const app = require('express')();
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: '', // TODO: insert your user
    password: '', // TODO: insert your password
    database: 'join_us'
})
const port = 4000;
const getUsersCountQuery = `SELECT COUNT(*) FROM users;`

app.get('/', function(req, res){
  const usersCount = makeQuery(getUsersCountQuery)
  console.log(usersCount);
  res.send(`
  Hello there buddy!
  You have ${usersCount}
  `)
});

app.get('/joke', function(req, res){
  res.send(`Wanna joke, huh? Sorry, get back tomorrow, they aren't here yet.`)
});

app.get('/random', function(req, res){
  res.send(`Your number is ${Math.floor(Math.random() * 10) + 1}`)
});

app.listen(port, () => console.log(`App is up and running on ${port} port`))


function resultCB(err, result, fields) {
  console.log(err);
  console.log(result);
}

function makeQuery(queryString, dataObject) {
  connection.connect()
  dataObject
   ? connection.query(queryString, dataObject, resultCB)
   : connection.query(queryString, resultCB) 
  connection.end()
}