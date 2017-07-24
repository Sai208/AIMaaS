const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const prospect_spend_summary = db.define('prospect_spend_summary', {
            Prospect_ID: {
                        type: Sequelize.INTEGER
            },
            Enablement_Strategy: {
                        type: Sequelize.STRING
            },
            Spend: {
                        type: Sequelize.FLOAT
            },
            PO_Count: {
                        type: Sequelize.DECIMAL
            },
            Invoice_Count: {
                        type: Sequelize.DECIMAL
            }
});

module.exports = prospect_spend_summary;