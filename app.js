const app = require('express')();
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: '', // TODO: insert your user
  password: '', // TODO: insert your password
  database: 'join_us'
})
const port = 4000;
const getEmailsCountQuery = `SELECT COUNT(*) as emails_count FROM emails;`
app.get('/', function (req, res) {
  connection.query(getEmailsCountQuery, (err, result, fields) => {
    if(err) {console.log('Error!!!', err); return err;}
    const [{emails_count}] = result;
    res.setHeader("Access-Control-Allow-Origin", true)
    res.send(`Hello there buddy! You have ${emails_count} Users in your app.`)
  })
});

app.post('/insert_user', (request, response) => {
  response.sendStatus(200);
})

app.listen(port, () => console.log(`App is up and running on ${port} port`))