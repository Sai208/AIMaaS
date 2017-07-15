const Sequelize = require('sequelize');
const db = require('../db/dbconnection');

const prospect_meta_data = db.define('prospect_meta_data', {
          Prospect_ID: {
                    type: Sequelize.STRING,
                    primaryKey: true,
                    autoIncrement: true
          },
          ProspectName: {
                    type: Sequelize.STRING
          },
          Version: {
                    type: Sequelize.STRING
          },
          Industry: {
                    type: Sequelize.STRING
                    // add foreign key to indsutry
          }
});

module.exports = prospect_meta_data;