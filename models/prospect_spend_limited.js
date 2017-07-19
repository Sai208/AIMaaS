const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const prospect_spend_limited = db.define('prospect_spend_limited', {
          Prospect_ID: {
                    type: Sequelize.INTEGER,
                    primaryKey: true
                    // add foreign key
          },
          Spend_USD: {
                    type: Sequelize.FLOAT(16,2)
          },
          PO_Count: {
                    type: Sequelize.INTEGER
          },
          Invoice_Count: {
                    type: Sequelize.INTEGER
          }
});

module.exports = prospect_spend_limited;