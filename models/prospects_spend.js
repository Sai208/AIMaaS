var db = require('../dbconnection');
var select = require('../selectQuery');
var fromQueryPart = ' from prospects_spend';
var whereQueryPart = ' where prospectId=?';

var prospects_spend = {
          getAllProspectSpend: function(callback) {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          },
          getProspectSpend: function(id, callback)          {
                    return db.query(select.selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          }
};

module.exports = prospects_spend;