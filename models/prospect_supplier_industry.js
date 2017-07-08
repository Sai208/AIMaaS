const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const prospect_supplier_industry = db.define('prospect_supplier_industry', {
          Supplier_Name: {
                    type: Sequelize.TEXT,
                    primaryKey: true
          },
          Capiq_Industry: {
                    type: Sequelize.TEXT
          }
})

module.exports = prospect_supplier_industry;