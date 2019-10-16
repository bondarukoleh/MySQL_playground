const faker = require('faker');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: '', // TODO: insert your user
    password: '', // TODO: insert your password
    database: 'join_us'
})

const resultCB = (err, result, fields) => {
    console.log(err);
    console.log(result);
}

const makeQuery = function (queryString, dataObject) {
    connection.connect()
    dataObject
     ? connection.query(queryString, dataObject, resultCB)
     : connection.query(queryString, resultCB) 
    connection.end()
}

const insertRandomEmailQuery = () => `
insert into emails(email, created_at) values('${faker.internet.email()}', '2019-03-03 12:00:00');`;
makeQuery(insertRandomEmailQuery());

// totally mysql package stuff
const getRandomEmailObject = () => ({email: faker.internet.email(), created_at: faker.date.past()});
const getRandomEmailArray = () => [faker.internet.email(), faker.date.past()];
makeQuery(`INSERT INTO emails SET ?`, getRandomEmailObject())

// another way of bulk add
// we need to pass [[['email_value1', 'data_value1'], ['email_value2', 'data_value2']]]
const manyUsersArr = [[]];
for(let i = 0; i < 100; i++){
    manyUsersArr[0].push(getRandomEmailArray())
}
makeQuery(`INSERT INTO emails(email, created_at) VALUES ?`, manyUsersArr)


