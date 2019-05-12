const app = require('express')();
const port = 4000;

app.get('/', function(req, res){
  res.send('Hello from web app')
});

app.listen(port, () => console.log(`App is up and runnint on ${port} port`))