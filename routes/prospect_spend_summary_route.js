const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const db = require('../db/dbconnection');
const prospectSpendSummary = require('../models/prospect_spend_summary');

router.post('/', (req, res) => {
            db.query('select * from prospect_spend_summary where Prospect_ID = :pid', {
                        replacements: {
                                    pid: req.body.id.toString()
                        },
                        type: Sequelize.QueryTypes.SELECT
            }).then(summary => {
                        res.json(summary);
            });
});

module.exports = router;