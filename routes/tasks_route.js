const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const tasks = require('../models/tasks');

router.get('/:id', (req, res) => {
    tasks.find({
        where: {
            Prospect_ID: id
        }
    }).then(task => {
        res.json(task);
    });
});

module.exports = router;