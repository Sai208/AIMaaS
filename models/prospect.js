var db = require('../dbconnection');
var select = require('../selectQuery');
var insertQueryPart = 'insert into prospects(name, accountType, industry) values(?,?,?)';
var fromQueryPart = ' from prospects';
var whereQueryPart = ' where prospectId=?';

var prospect = {
          getAllProspects: function(callback)     {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          },
          getProspect: function(id, callback)     {
                    return db.query(select.selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          },
          insertProspect: function(name, type, industry, callback)    {
                    return db.query(insertQueryPart, [name], [type], [industry], callback);
          }
};

module.exports = prospect;