const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

 router.post('/', (req, res) => {
     db.query('select * from prospect_savings_aggregate where Prospect_ID = :pid', {
         replacements: {
             pid: req.body.id.toString()
         },
            type: Sequelize.QueryTypes.SELECT
     }).then(aggregate => {
         res.json(aggregate);
     });        
 });

module.exports = router; 