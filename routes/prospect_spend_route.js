const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const prospectSpend = require('../models/prospect_spend');

router.get('/:id', (req, res) => {
                prospectSpend.findAll({
                  where: {
                    Prospect_ID: id
                  }
                }).then(summary => {
                  res.json(summary);
                });
});

router.get('/', (req, res) => {
  prospectSpend.findAll().then(summary => {
    res.json(summary);
  });
});

module.exports = router;
