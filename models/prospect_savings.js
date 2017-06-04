var db = require('../dbconnection');
var select = require('../selectQuery.js');
var fromQueryPart = ' from prospect_savings';
var whereQueryPart = ' where prospectId=?';

var prospect_savings = {
          getAllProspectSavings: function(callback)         {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          },
          getProsectSavings: function(id, callback)         {
                    return db.query(select.selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          }
};

module.exports = prospect_savings;