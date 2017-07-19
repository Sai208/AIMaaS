const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const capiq = db.define('capiqdata', {
          companyName: {
                    type: Sequelize.STRING,
                    primaryKey: true
          }
});

module.exports = capiq;