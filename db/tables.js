var tables = {
          accountTypesTable: {
                    name: 'accounttypes',
                    columns: {
                              typeColumn: 'type'
                    }
          },
          capiqdataTable: {
                    name: 'capiqdata',
                    columns: {
                              companyNameColumn: 'companyName'
                    }
          },
          industryTable: {
                    name: 'industry',
                    columns: {
                              industryColumn: 'industry'
                    }
          },
          industryMetaDataTable: {
                    name: 'industry_meta_data',
                    columns: {
                              prospectIndustryColumn: 'Prospect_Industry',
                              criticalIndustryColumn: 'Crtitical_Industries',
                              supplierComplianceMultiplierColumn: 'Supplier_Compliance_Multiplier',
                              invoiceErrorMultiplierColumn: 'Invoice_Error_Multiplier',
                              poReqAndTransMultiplierColumn: 'PO_Req_and_Trans_Multiplier',
                              invoiceReceiptMultiplierColumn: 'Invoice_Receipt_Multiplier'
                    }
          },
          networkSupplierTable: {
                    name: 'network_suppliers',
                    columns: {
                              supplierNameColumn: 'Supplier_Name',
                              supplierIDColumn: 'Supplier_ID'
                    }
          },
          prospectMetaDataTable: {
                    name: 'prospect_meta_data',
                    columns: {
                              prospectIDColumn: 'Prospect_ID',
                              prospectNameColumn: 'Prospect_Name',
                              versionColumn: 'Version',
                              industryColumn: 'industry'
                    }
          },
          prospectSavingsTable: {
                    name: 'prospect_savings',
                    columns: {
                              prospectIDColumn: 'Prospect_ID',
                              enablementStrategyColumn: 'Enablement_Strategy',
                              supplierComplianceSavingsMultiplierColumn: 'Supplier_Compliance_Savings_M',
                              invoiceErrorReductionsSavingsMultiplerColumn: 'Invoice_Error_Reduction_Savings_M',
                              poRequisitionTransmissionSavingsMultiplierColumn: 'PO_Requisition_Transmission_Savings_M',
                              invoiceReceiptProcessingSavingsMultiplierColumn: 'Invoice_Receipt_Processing_Savings_M'
                    }
          },
          prospectSpendTable: {
                    name: 'prospect_spend',
                    columns: {
                              prospectIDColumn: 'Prospect_ID',
                              prospectSupplerNameColumn: 'Prospect_Supplier_Name',
                              capiqIndustryColumn: 'Capiq_Industry',
                              spendUSDColumn: 'SpendUSD',
                              poCountColumn: 'PO_Count',
                              invoiceCountColumn: 'Invoice_Count',
                              enablementStrategyColumn: 'Enablement_Strategy',
                              matchStatusColumn: 'Match_Status',
                              criticalColumn: 'Critical'
                    }
          },
          prospectSpendLimitedTable: {
                    name: 'prosepct_spend_limited',
                    columns: {
                              prospectIDColumn: 'Prospect_ID',
                              spendUSDColumn: 'Spend_USD',
                              poCountColumn: 'PO_Count',
                              invoiceCountColumn: 'Invoice_Count'
                    }
          },
          prospectSupplierIndustryTable: {
                    name: 'prospect_supplier_industry',
                    columns: {
                              supplierNameColumn: 'Supplier_Name',
                              capiqIndustryColumn: 'Capiq_Industry'
                    }
          },
          tasksTable: {
                    name: 'tasks',
                    columns: {
                              prospectIDColumn: 'Prospect_ID',
                              taskNameColumn: 'Task_Name',
                              taskDescColumn: 'Task_Desc',
                              isDoneColumn: 'isDone'
                    }
          },
          usercredsTable: {
                    name: 'usercreds',
                    columns: {
                              userIDColumn: 'userId',
                              passwordColumn: 'password'
                    }
          }
};

module.exports = tables;