var db = require('../db/dbconnection');
var select = require('../selectQuery');
var fromQueryPart = ' from prospect_supplier_industry';

var prospect_supplier_industry = {
          getAllSupplierIndustry: function(callback)        {
                    return db.query(select.selectAllQueryPart + fromQueryPart, callback);
          }
};

module.exports = prospect_supplier_industry;