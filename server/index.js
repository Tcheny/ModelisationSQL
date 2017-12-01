const express = require('express');
const card = require('./controllers/card');
const list = require('./controllers/list');
const user = require('./controllers/user');

const app = express();
app.use(express.json());
app.use('/cards', card);
app.use('/lists', list);
app.use('/users', user);

// intercepter les erreurs 404
app.all('/*', (req, res)=>{
  res.status(404).send('je suis la 404')
})

app.listen(3000, ()=>{
  console.log('listen on 3000');
})
