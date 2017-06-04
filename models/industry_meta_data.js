var db = require('../dbconnection');
var selectAllQueryPart = "select *";
var selectQueryPart = "select ";
var fromQueryPart = " from industry_meta_data";
var whereQueryPart = " where prospect_industry=?";
var criticalIndustry = "critical_industries";
var supplierCompliance = "supplier_compliance_multiplier";
var invoiceError = "invoice_error_multiplier";
var poReqTrans = "po_req_and_trans_multiplier";
var invoiceReceipt = "invoice_receipt_multiplier";

var industry_meta_data = {
          getAllMetaData: function(callback)      {
                    return db.query(selectAllQueryPart + fromQueryPart, callback);
          },
          getProspectIndustryMetaData: function(id, callback)         {
                    return db.query(selectAllQueryPart + fromQueryPart + whereQueryPart, [id], callback);
          },
          getCriticalIndustry: function(id, callback)       {
                    var result = db.query(selectQueryPart + criticalIndustry + fromQueryPart + whereQueryPart, [id], callback);
                    var array = result.split(',');
                    return JSON.stringify(array);
          },
          getSupplierComplianceMultiplier: function(id, callback)     {
                    return db.query(selectQueryPart + supplierCompliance + fromQueryPart + whereQueryPart, [id], callback);
          },
          getInvoiceErrorMultiplier: function(id, callback) {
                    return db.query(selectQueryPart + invoiceError + fromQueryPart + whereQueryPart, [id], callback);
          },
          getPOReqAndTransMultiplier: function(id, callback)          {
                    return db.query(selectQueryPart + poReqTrans + fromQueryPart + whereQueryPart, [id], callback);
          },
          getInvoiceReceiptMultiplier: function(id, callback)         {
                    return db.query(selectQueryPart + invoiceReceipt + fromQueryPart + whereQueryPart, [id], callback);
          }
};

module.exports = industry_meta_data;