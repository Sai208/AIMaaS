var db = require('../db/dbconnection');
var select = require('../selectQuery');
var fromQueryPart = ' from prospect_spend_limited';
var whereQueryPart = ' where prospectId=?';

var prospect_spend_limited = {
          getAllProspects: function(callback)     {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          },
          getProspect: function(id, callback)     {
                    return db.query(select.selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          }
};

module.exports = prospect_spend_limited;