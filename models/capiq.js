var db = require('../db/dbconnection');

const query = require('../db/queryPart');
const tables = require('../db/tables');
const table = tables.capiqdataTable;

var selectQuery = query.selectAllQueryPart + query.fromPart + table.name + query.wherePart + table.columns.companyNameColumn +"=?";
var selectAllQuery = query.selectAllQueryPart + query.fromPart + table.name;
var insertQuery = query.insertPart + table.name + query.values1Part;
var deleteQuery = query.deletePart + table.name + query.wherePart + table.columns.companyNameColumn + "=?";

var capiq = {
          getAllCapiqData: function(callback) {
                    return db.query(selectAllQuery, callback);
          },
          getCapiqData: function(companyName, callback) {
                    return db.query(selectQuery, [companyName], callback);
          }
}