const app = require('express')();
const mysql = require('mysql');
const path = require('path');
const bodyParser = require('body-parser');

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
// const connection = mysql.createConnection({
//   host: 'localhost',
//   user: '', // TODO: insert your user
//   password: '', // TODO: insert your password
//   database: 'join_us'
// })
const port = 4000;
const emailsCountQuery = `SELECT COUNT(*) as emails_count FROM emails;`
const insertEmailQuery = `INSERT INTO emails SET ?;`


app.get('/', function (req, res) {
  // connection.query(emailsCountQuery, (err, result, fields) => {
  //   if (err) { console.log('Error!!!', err); return err; }
  //   const [{ emails_count }] = result;
  //   res.setHeader("Access-Control-Allow-Origin", true)
  //   res.send(`Hello there buddy! You have ${emails_count} Users in your app.`)
  // })
  // res.sendFile(path.resolve(__dirname, './pages/index.html'))
  res.render('index', { userEmails: 500 }) // by default looking in "views" directory, and file home.ejs, because app.set('view engine', 'ejs')
});

app.post('/insert_user', (request, response) => {
  const { body: { userEmail } } = request;
  console.log(userEmail);
  // connection.query(insertEmailQuery, {email: userEmail}, (err, result, fields) => {
  //   if (err) { console.log('Error!!!', err); return err; }
  //   response.redirect('index', { userEmails: 501 })
  // })
  response.redirect('/')
})

app.listen(port, () => console.log(`App is up and running on ${port} port`))