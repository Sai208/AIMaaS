var db = require('../db/dbconnection');
var select = require('../selectQuery');
var fromQueryPart = ' from unmatched_suppliers';
var whereQueryPart = ' where prospectId=?';

var unmatched_suppliers = {
          getAllUnmatchedSuppliers: function(callback)      {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          },
          getUnmatchedSuppliers: function(id, callback)     {
                    return db.query(select.selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          }
};

module.exports = unmatched_suppliers;