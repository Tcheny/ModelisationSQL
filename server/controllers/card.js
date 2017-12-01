const express = require('express');

const router = express.Router()

router.get('/card', (req, res) => {
 res.send('coucou card')
})

module.exports = router;
