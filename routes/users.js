var express = require('express');
var router = express.Router();
var user=  require('../models/user');

/* GET users listing. */
router.get('/:id?', (req, res, next)=>{
  if(req.params.id) {
    user.getUserById(req.params.id, (err, rows)=>{
      if(err) {
        res.json(err);
      } else {
        res.json(rows);
      }
    });
  } else {
    user.getAllUsers((err, rows)=>{
      if(err) {
        res.json(err);
      } else {
        res.json(rows);
      }
    });
  }
  // pool.query('Select * from userCreds',(err, rows, next)=>{
  //   if(err) {
  //     res.json(err);
  //   } else {
  //     res.json(rows);
  //   }
  // });
  // res.send('respond with a resource');
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

router.put('/:id', (req, res, next)=>{
  user.updateUser(req.params.id, req.body, (err, rows)=>{
    if(err) {
      res.send(err);
    } else {
      res.json(rows);
    }
  });
});

module.exports = router;
