const mysql = require('mysql');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'trello2',
  socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock'
});

db.connect((err)=>{
  if(err) {
    return console.log(err)
  }
  console.log('DB CONNECTED !!!')
})

db.asyncQuery = (query) => new Promise( (resolve, reject )=>{
  db.query(query,(err, result)=>{
    err ? reject(err) : resolve(result)
  })
})

module.exports = db;
