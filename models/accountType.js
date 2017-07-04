var db = require('../db/dbconnection');

const query = require('../db/queryPart');
const tables  = require('../db/tables');

const table = tables.accountTypesTable;
var selectQuery = query.selectAllQueryPart + query.fromPart + table.name + query.wherePart + table.columns.typeColumn +"=?";
var selectAllQuery = query.selectAllQueryPart + query.fromPart + table.name;
var insertQuery = query.insertPart + table.name + query.values1Part;
var deleteQuery = query.deletePart + table.name + query.wherePart + table.columns.typeColumn +"=?";

var accountType = {
          getAllAccountType: function(callback)   {
                    return db.query(selectAllQuery, callback);
          },
          getAccountType: function(type, callback)          {
                    return db.query(selectQuery, [type], callback);
          },
          addAccountType: function(type, callback)          {
                    return db.query(insertQuery, [type], callback);
          },
          deleteUser: function(type, callback)    {
                    return db.query(deleteQuery, [type], callback);
          }
};

module.exports = accountType;