var express = require('express');
var mysql  = require('mysql');

var pool = mysql.createPool({
          connectionLimit:    100,
          host:     'localhost',
          user:     'root',
          password: 'root',
          database: 'nodeTut'
});

module.exports = pool;