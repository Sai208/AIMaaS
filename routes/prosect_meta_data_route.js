const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const prospect =  require('../models/prospect_meta_data');

/**
 * This method gets all the prospect's meta data blindly.
 */
router.get('/', (req, res) => {
          prospect.findAll()
                    .then(prospects => {
                              res.json(prospects);
                    });
});

/**
 * This method gets the meta data for a particular prospect
 */
router.get('/:prospectName', (req, res) => {
          prospect.findOne({
                    where: {
                              Prospect_Name: req.params.prospectName
                    }
          }).then(prospects => {
                    res.json(prospects);
          });
});

/**
 * This method updates the version for a aprticular prosect
 */
router.post('/', (req, res) => {
          prospect.update(
                    {Version: req.body.Version.toString()},
                    {where: {Prospect_Name: req.body.Prospect_Name.toString()}}
          ).then(prospect => {
                    res.json(prospect);
          }).catch(err => {
                    res.json(err);
          });
});

module.exports = router;