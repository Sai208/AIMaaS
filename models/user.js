var db = require('../dbconnection');

var user = {
          getAllUsers: function(callback) {
                    return db.query('select * from userCreds', callback);
          },
          getUserById: function(id, callback) {
                    return db.query('select * from userCreds where userId=?',[ id], callback);
          },
          addUser: function(user, callback) {
                    return db.query('insert into userCreds values(?,?)', [user.userId], [user.password], callback);
          },
          deleteUser: function(id, callback) {
                    return db.query('delete from userCreds where userId=?', [id], callback);
          },
          updateUser: function(id, user, callback) {
                    return db.query('update userCreds set userId=?, password=? where userId=?', [user.userId], [user.password], [id], callback);
          }
};

module.exports = user;