const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const prospectSavings = require('../models/prospect_savings');

router.get('/:id', (req, res) => {
    prospectSavings.find({
                  where: {
                    Prospect_ID: id
                  }
                }).then(summary => {
                  res.json(summary);
                });
});

router.post('/', (req, res) => {
    prospectSavings.findAll({
                  where: {
                    Prospect_ID: req.body.id.toString(),
                    $or: [
                      {Enablement_Strategy: 'Important'},
                      {Enablement_Strategy: 'Quick Win'}
                    ]
                  }
                }).then(summary => {
                  res.json(summary);
                });
});

module.exports = router;