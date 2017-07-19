const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const tasks = db.define('tasks', {
          Prospect_ID: {
                    type: Sequelize.STRING,
                    primaryKey: true
                    // add foreign key reference
          },
          Task_Name: {
                    type: Sequelize.TEXT
          },
          Task_Desc: {
                    type: Sequelize.TEXT
          },
          isDone: {
                    type: Sequelize.INTEGER
          }
});

module.exports = tasks;