const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const user =  require('../models/user');

/**
 * Method to check if the current user is authorized and if so what type of user is zhe.
 */
router.post('/authenticate', (req, res) => {
  user.findAll({
    attributes: ['userType', [Sequelize.fn('COUNT', Sequelize.col('userId')), 'EXISTS']],
    where: {
      userId: req.body.userId.toString(),
      password: req.body.password.toString()
    }
  }).then(authorization => {
    res.json(authorization);
  });
});

/**
 * Method to add a new user. The user data is sent in the body of the request object.
 */
router.post('/', (req, res, next)=>{
  user.addUser(req.body, (err, rows)=>{
    if(err) {
      res.send(err);
    } else {
      res.json(req.body);
    }
  });
});

/**
 * Method to delete a user from the database. Is kept for future use, but in current scenario, it does not serve any purpose, decoratory apart.
 */
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
