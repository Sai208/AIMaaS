var db = require('../dbconnection');
var fromQuery = " from accountType";
var fromWhereQuery = " from accountType where type=?";
var selectAllQuery = "select *";
var selectTypeQuery = "select type";
var insertQuery = "insert into accountType values(?)";
var deleteQuery = "delete from accountType where type=?";

var accountType = {
          getAllAccountType: function(callback)   {
                    return db.query(selectAllQuery + fromQuery, callback);
          },
          getAccountType: function(type, callback)          {
                    return db.query(selectTypeQuery + fromWhereQuery, [type], callback);
          },
          addAccountType: function(type, callback)          {
                    return db.query(insertQuery, [type], callback);
          },
          deleteUser: function(type, callback)    {
                    return db.query(deleteQuery, [type], callback);
          }
};

module.exports = accountType;