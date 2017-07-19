const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const industry_meta_data = db.define('industry_meta_data', {
          Prospect_Industry: {
                    type: Sequelize.TEXT,
                    primaryKey: true
          },
          Critical_Industries: {
                    type: Sequelize.TEXT
          },
          Supplier_Compliance_Multiplier: {
                    type: Sequelize.FLOAT(10,6)
          },
          Invoice_Error_Multiplier: {
                    type: Sequelize.FLOAT(10,6)
          },
          PO_Req_and_Trans_Multiplier: {
                    type: Sequelize.FLOAT(10,6)
          },
          Invoice_Receipt_Multiplier: {
                    type: Sequelize.FLOAT(10,6)
          }
})
module.exports = industry_meta_data;