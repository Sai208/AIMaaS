const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const unmatched_suppliers = db.define('unmatched_suppliers', {
          Prospect_ID: {
                    type: Sequelize.INTEGER,
                    primaryKey: true
          },
          Prosepect_Supplier_Name: {
                    type: Sequelize.STRING,
                    primaryKey: true
          },
          Spend_USD: {
                    type: Sequelize.FLOAT(16,2)
          },
          PO_Count: {
                    type: Sequelize.INTEGER
          },
          Invoice_Count: {
                    type: Sequelize.INTEGER
          },
          SMP_USD: {
                    type: Sequelize.FLOAT(16,2)
          },
          Enablement_Strategy: {
                    type: Sequelize.STRING,
                    notNull: true
                    //add a belongs to reference here
          },
          Initial_time_MMM: {
                    type: Sequelize.STRING,
                    notNull: true
          },
          Initial_time_YYYY: {
                    type: Sequelize.STRING,
                    notNull: true
          },
          Match_Current_Status: {
                    type: Sequelize.ENUM('Y','N'),
                    notNull: true
          }
})

module.exports = unmatched_suppliers;