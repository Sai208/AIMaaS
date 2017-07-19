const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const accountType = db.define('accounttypes', {
          type: {
                    type: Sequelize.STRING,
                    primaryKey: true
          }
});

module.exports = accountType;