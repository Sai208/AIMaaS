const Sequelize = require('sequelize');
var db = require('../db/dbconnection');

const User = db.define('usercreds', {
          userId: {
                    type: Sequelize.STRING,
                    primaryKey: true
          },
          password: {
                    type: Sequelize.STRING
          }
});

module.exports = User;