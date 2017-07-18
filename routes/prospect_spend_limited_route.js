const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const prospectSpend = require('../models/prospect_spend_limited');

/**
 * Creates a new entry in the prospect_spend_limited table for a prospect.
 */
router.post('/', (req, res) => {
          prospectSpend.create({
                    Prospect_ID: req.body.Propsect_ID.toString(),
                    Spend_USD: parseFloat(req.body.Spend_USD.toString()),
                    PO_Count: parseInt(req.body.PO_Count.toString()),
                    Invoice_Count: parseInt(req.body.Invoice_Count.toString())
          }).then(created => {
                    res.json(created);
          }).catch(err => {
                    res.json(err);
          });
});

/**
 * Finds the values for a particular prospect id.
 */
router.get('/:id', (req, res) => {
          prospectSpend.findOne({
                    where: {
                              Prospect_ID: id
                    }
          }).then(result => {
                    res.json(result);
          }).catch(err => {
                    res.json(err);
          });
});

module.exports = router;
