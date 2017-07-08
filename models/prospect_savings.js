const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const prospect_savings = db.define('prospect_savings', {
          Prospect_ID: {
                    type: Sequelize.INTEGER,
                    primaryKey: true
                    // add foreign key reference
          },
          Enablment_Strategy: {
                    type: Sequelize.STRING
                    //add foreign key reference
          },
          Supplier_Invoice_Savings_M: {
                    type: Sequelize.FLOAT(16,2)
          },
          Invoice_Error_Reductions_Savings_M: {
                    type: Sequelize.FLOAT(16,2)
          },
          PO_Requisistion_Transmission_Savings_M: {
                    type: Sequelize.FLOAT(16,2)
          },
          Invoice_Receipt_Processing_Savings_M: {
                    type: Sequelize.FLOAT(16,2)
          }
})

module.exports = prospect_savings;