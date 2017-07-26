const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const db = require('../db/dbconnection');
const unmatchedSuppliers = require('../models/unmatched_suppliers');

router.get('/priorityList', (req, res) => {
    db.query('select * from supplier_priority_list').then(priorityList => {
        res.json(priorityList);
    });
});

router.get('/importantSupplier', (req, res) => {
    db.query('select * from important_supplier_match').then(matched => {
        res.json(matched);
    });
});

router.get('/quickWinSupplier', (req, res) => {
    db.query('select * from quick_win_supplier_match').then(matched => {
        res.json(matched);
    });
});

router.get('/mediumSupplier', (req, res) => {
    db.query('select * from medium_supplier_match').then(matched => {
        res.json(matched);
    });
});

router.get('/smallSupplier', (req, res) => {
    db.query('select * from small_supplier_match').then(matched => {
        res.json(matched);
    });
});

router.get('/:id', (req, res) => {
  unmatchedSuppliers.findAll({
      attributes: ['Prospect_Supplier_Name', 'SMP_USD', 'Match_Current_Status'],   
      where: {
          Prospect_ID: req.params.id
      }
  }).then(suppliers => {
      res.json(suppliers);
  });
});

module.exports = router;
