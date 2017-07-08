var express = require('express');
var router = express.Router();
var user=  require('../models/user');

/* GET users listing. */
router.post('/authenticate', (req, res) => {
  user.count({
    where: {
      userId: req.body.userId.toString(),
      password: req.body.password.toString()
    }
  }).then(count => {
    res.json(count);
  })
});

router.post('/', (req, res, next)=>{
  user.addUser(req.body, (err, rows)=>{
    if(err) {
      res.send(err);
    } else {
      res.json(req.body);
    }
  });
});

router.delete('/:id', (req, res, next)=>{
  user.deleteUser(req.params.id, (err, count)=>{
    if(err) {
      res.send(err);
    } else {
      res.json(count);
    }
  });
});

module.exports = router;
