const express = require('express')
const model = require('../models/list');
const db = require('../models/db')

const router = express.Router()

router.get('/', (req, res) => {
  model.getLists()
    .then(result => res.json(result))
    .catch(err => res.json(err))
})
  // try {
  //   res.json(await model.getLists())
  // } catch (err) {
  //   res.json(err)
  // }

router.post('/', (req, res)=>{
    const { name } = req.body

    model.createList( name )
      .then(result => res.json(result))
      .catch(err => res.json(err))
})

router.put('/:id', (req, res)=>{
  model.updateList(req.params.id, req.body.name )
    .then(result => res.json(result))
    .catch(err => res.json(err))
})

router.delete('/:id', (req, res)=>{
  model.deleteList(req.params.id)
    .then(result => res.json(result))
    .catch(err => res.json(err));
})

module.exports = router;
