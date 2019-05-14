const express = require('express');
const app = express();
const mysql = require('mysql');
const path = require('path');
const bodyParser = require('body-parser');

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
// eslint-disable-next-line no-undef
app.use(express.static(__dirname + '/styles'))
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root', // TODO: insert your user
  password: '1234', // TODO: insert your password
  database: 'join_us'
})
const port = 4000;
const emailsCountQuery = `SELECT COUNT(*) as emails_count FROM emails;`
const insertEmailQuery = `INSERT INTO emails SET ?;`


app.get('/', function (req, res) {
  connection.query(emailsCountQuery, (err, result, fields) => {
    if (err) { console.log('Error!!!', err); return err; }
    const [{ emails_count }] = result;
    /* res.sendFile(path.resolve(__dirname, './pages/index.html')) same as */
    res.render('index', { userEmails: emails_count }) // by default looking in "views" directory, and file home.ejs, because app.set('view engine', 'ejs')
  })
});

app.post('/insert_user', (request, response) => {
  const { body: { userEmail } } = request;
  connection.query(insertEmailQuery, { email: userEmail }, (err, result, fields) => {
    if (err) { console.log('Error!!!', err); return err; }
    response.redirect('/')
  })
})

app.listen(port, () => console.log(`App is up and running on ${port} port`))