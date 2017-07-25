library(tm)
library(SnowballC)
library(stringdist)
library(RecordLinkage)
library(plyr)
library(textcat)
library(translate)
library(stringr)
library(rio)
library(RODBC)
library(RODBCDBI)
library(sqldf)
library(RMySQL)
library(readxl)

#conn = "MySQL" #if connecting to ai-maas
conn = "nodeTut" #if connecting to nodetut
#conn = "SQL_EXPRESS" #if connecting to SQL Server


#table names assignment
pSpendTable = "prospect_spend"
pSpendLtd = "prospect_spend_limited"
pMetaTable = "prospect_meta_data"
SMOTable = "unmatched_suppliers"
indMetaTable = "industry_meta_data"
pIndTable = "prospect_supplier_industry"
nwSuppTable = "network_suppliers"
pSavings = "prospect_savings"
pTasksTable = "tasks"

pSpendTableColOrder = c('Prospect_ID',	'Prospect_Supplier_Name',	'CapIq_Industry',	'Spend_USD',	'PO_Count',	'Invoice_Count',	'Enablement_Strategy',	'Match_Status',	'Critical')
pSpendLtdColOrder = c('Prospect_ID',	'Spend_USD',	'PO_Count',	'Invoice_Count')
pMetaTableColOrder = c('Prospect_ID',	'Prospect_Name',	'Version',	'Industry')
SMOTableColOrder = c('Prospect_ID',	'Prospect_Supplier_Name',	'Spend_USD',	'PO_Count',	'Invoice_Count',	'SMP_USD',	'Enablement_Strategy',	'Initial_time_MMM',	'Initial_time_YYYY', 'Match_Current_Status')
indMetaTableColOrder = c('Prospect_Industry',	'Critical_Industries',	'Supplier_Compliance_Multiplier',	'Invoice_Error_Multiplier',	'PO_Req_and_Trans_Multiplier',	'Invoice_Receipt_Multiplier')
pIndTableColOrder = c('Supplier_Name',	'CapIq_Industry')
nwSuppTableColOrder = c('Supplier_Name', 'Supplier_ID')
pSavingsColOrder = c('Prospect_ID',	'Enablement_Strategy',	'Supplier_Compliance_Savings_USD',	'Invoice_Error_Reduction_Savings_USD',	'PO_Requisition_Transmission_Savings_USD',	'Invoice_Receipt_Processing_Savings_USD')
pTasksTableColOrder = c('Prospect_ID', 'Task_Name', 'Task_Desc','IsDone')
unNecSavingCol = c('Spend_USD', 'PO_Count', 'Invoice_Count', 'Supplier_Compliance_Multiplier', 'Invoice_Error_Multiplier', 'PO_Req_and_Trans_Multiplier', 'Invoice_Receipt_Multiplier')



# args = commandArgs(TRUE)
# pid = try(as.character(args[1]), silent = TRUE)
# if(length(grep("ERROR", toupper(pid)))){
#   appendError(pid, paste("reading prospect Id argument from command line ", sep=""), pTasksTable, pTasksTableColOrder, 10000)
# }
# fPath = try(as.character(args[2]), silent = TRUE)
# if(length(grep("ERROR", toupper(fPath)))){
#   appendError(fPath, paste("reading file path from command line ", sep=""), pTasksTable, pTasksTableColOrder, 10000)
# }
# fName = try(as.character(args[3]), silent = TRUE)
# if(length(grep("ERROR", toupper(fName)))){
#   appendError(fName, paste("reading file name from command line ", sep=""), pTasksTable, pTasksTableColOrder, 10000)
# }

pid = 4
# fPath = "~/Work/Codathon/Data for Tables in Database/Testing"
fName = "Advanced_Mock_Data.xlsx"

# setwd(fPath)


#Common condition
commCond = paste("Prospect_ID = ", pid, sep="")

readTable = function(myTable, condition=NULL) {
  print("we are starting the readuse function now")
  dbhandle <- odbcConnect(conn)
  print("this is the dbhandle: ", dbhandle)
  query = paste('select * from ', myTable ,sep="")
  print("this is the query: ", query)
  if(!is.null(condition)){
    query = paste(query, ' where ', condition, sep="")
    print("this is the query inside the if: ", query)
  }
  print("we are heading to res")
  res = try(sqlQuery(dbhandle, query), silent = TRUE)
  print("this is the result: ", res)
  close(dbhandle)
  if(length(grep("ERROR", toupper(res)))){
    appendError(res, paste("reading Table ", myTable, sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
  #close(dbhandle)
  as.data.frame(res)
}

calSMP = function(PO_Count, Inv_Count, Spend_USD) {
  doc_Count = PO_Count + Inv_Count
  minSMP = as.vector(rep(20000, length(doc_Count)))
  checkElig = (doc_Count > 5) | (Spend_USD > 50000)
  SMP = apply(as.array(0.00155*Spend_USD), 1, function(x){min(x, 20000)})*checkElig
  SMP
}

deleteRows = function(myTable, condition) {
  dbhandle <- odbcConnect(conn)
  query = paste('delete from ', myTable ,' where ', condition, sep="")
  res = try(sqlQuery(dbhandle, query), silent = TRUE)
  close(dbhandle)
  if(length(grep("ERROR", toupper(res)))){
    appendError(res, paste("deleting Table ", myTable, sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
}


writeTable = function(df, myTable, upd = FALSE) {
  dbhandle <- odbcConnect(conn)
  #try(sqlDrop(dbhandle, myTable, errors = FALSE), silent = TRUE)
  if (upd){
    res = try(sqlSave(dbhandle, df, tablename = myTable, append=T, rownames = F, fast = F, colnames = F, safer = T), silent = TRUE)
    #sqlSave(dbhandle, df, tablename = myTable, append=T, rownames = F, fast = F, colnames = F, safer = T)
  } else {
    res = try(sqlSave(dbhandle, df, myTable, append = FALSE, rownames = F, fast = F, colnames = F, safer = T), silent = TRUE)
  }
  if(length(grep("ERROR", toupper(res)))){
    close(dbhandle)
    appendError(res, paste("writing ", myTable, sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
  query = paste('select count(*) from ', myTable ,sep="")
  res = try(sqlQuery(dbhandle, query), silent = TRUE)
  close(dbhandle)
  if(length(grep("ERROR", toupper(res)))){
    appendError(res, paste("evaluating ", query, sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
  res
}

appendError = function(res, taskName, myTable, colOrder, pros_id) {
  #close(handle)
  taskDone = 0
  df_args <- as.list(c(res, sep=""))
  errMsg = do.call(paste, df_args)
  errDf = as.data.frame(cbind(pros_id, taskName, errMsg, taskDone))
  colnames(errDf) = colOrder
  condition = paste("Prospect_ID = ", pros_id, sep="")
  deleteRows(myTable, condition)
  writeTable(errDf, myTable, upd = TRUE)
  quit(save = "no")
}


aiMatch = function(compareData, renData) {
  compareData = compareData[order(compareData[,1]),]
  renData = renData[order(renData[,1]),]
  
  
  compareData = as.data.frame(compareData)
  renData = as.data.frame(renData)
  
  ext = as.data.frame(compareData[,1])
  ren = as.data.frame(renData[,1])
  
  ext$normalName = as.character(ext[,1])
  ren$normalName = as.character(ren[,1])
  
  minusWords = c('co', 'corp', 'ltd', 'inc', 'limited', 'llc', 
                 'pty', 'sa', 'company', 'incorporated', 'srl',
                 'pte', 's.r.l', 'l.l.c', 'l.p', 's.a', 'ag',
                 'p/l', 'k.k', 's.r.o', 'r.s', 'b.v', 'de', 'c.v', 'cv',
                 'lp', 'sp', 'zo', 'gmbh', 'and', 'corporation', 'intl', 'corpo', 
                 'corp', 'corporat', 'corporate', 'sdn', 'bhd', 'sprl')
  
  trim <- function(x) return(gsub("^ *|(?<= ) | *$", "", x, perl=T))
  
  createCorpus = function(x)
  {
    x = tolower(x)
    First5 = substr(x, 1, 5)
    Last5 = str_sub(x, -5, -1)
    SecFirst5 = substr(x, 2, 5)
    isNumericFirst5 = !is.na(as.numeric(First5))
    isNumericLast5 = !is.na(as.numeric(Last5))
    isNumericSecFirst5 = !is.na(as.numeric(SecFirst5))
    if(isNumericFirst5 || isNumericLast5 || isNumericSecFirst5)
    {
      x = removeNumbers(x)
    }
    x = removeWords(x, minusWords)
    x = removePunctuation(x)
    trim(x)
  }
  
  englishOnly = function(x)
  {
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "a", x)
    x= gsub("?", "c", x)
    x= gsub("?", "e", x)
    x= gsub("?", "e", x)
    x= gsub("?", "i", x)
    x= gsub("?", "i", x)
    x= gsub("?", "i", x)
    x= gsub("?", "o", x)
    x= gsub("?", "o", x)
    x= gsub("?", "o", x)
    x= gsub("?", "o", x)
    x= gsub("?", "o", x)
    x= gsub("s", "s", x)
    x= gsub("?", "u", x)
    x= gsub("?", "u", x)
    x= gsub("z", "z", x)
    x
  }
  
  ext$normalName = createCorpus(ext$normalName)
  ren$normalName = createCorpus(ren$normalName)
  
  ext = subset(ext, normalName != '')
  ren = subset(ren, normalName !='')
  
  ext$normalName = englishOnly(ext$normalName)
  ren$normalName = englishOnly(ren$normalName)
  
  ext$startsWith = as.factor(substr(ext$normalName,1,1))
  ren$startsWith = as.factor(substr(ren$normalName,1,1))
  
  colnames(ext)[1] = "ExtCustName"
  colnames(ren)[1] = "RenCustName"
  
  extsub = NULL
  rensub = NULL
  
  extStartVec = levels(ext$startsWith)
  renStartVec = levels(ren$startsWith)
  lenextStart = length(extStartVec)
  lenrenStart = length(renStartVec)
  
  for(m in 1: lenextStart)
  {
    n = which(renStartVec == extStartVec[m])
    if(length(n)>0)
    {
      extsub[[m]] = subset(ext, startsWith == extStartVec[m])
      rensub[[m]] = subset(ren, startsWith == renStartVec[n])
    }
  }
  
  jaroprep = 0
  match.s1.s2 = NULL
  levenprep = 0
  levensim = 0
  
  for(m in 1:lenextStart)
  {
    startChar = unique(extsub[[m]][,3])  
    extrow = nrow(extsub[[m]])
    renrow = nrow(rensub[[m]])
    comp = rensub[[m]][,2]
    against = extsub[[m]][,2]
    
    if(length(comp)>0)
    {
      jaro = lapply(comp, 
                    function(x, y)
                    {
                      jaroprep = jarowinkler(x,y)
                      maxJaro = max(jaroprep, na.rm = T)
                      maxJaroId = which.max(jaroprep)
                      cbind(maxJaroId, maxJaro)
                    }, 
                    y = against)
      
      jaro = t(as.data.frame(sapply(jaro, "[", c(1,2))))
      jaro = as.data.frame(jaro)
      jaroScore = jaro[,2]
      jaromaxId = jaro[,1]
      
      renname = as.data.frame(rensub[[m]][,1])
      extname = as.data.frame(extsub[[m]][jaromaxId,1])
      
      matched = NULL
      
      if(nrow(renname)>nrow(extname)) 
      {
        for (s in 1:nrow(renname))
        {
          matched = rbind(cbind(renname[s,1], extname, jaroScore), matched)
        }
      }
      
      if(nrow(renname)<nrow(extname)) 
      {
        matched = rbind(cbind(renname, extname[1,1], jaroScore), matched)
      }
      
      if(nrow(renname)==nrow(extname)) 
      {
        matched = rbind(cbind(renname, extname, jaroScore), matched)
      }
      
      if(!is.null(matched)){
        colnames(matched)[1] = "renCustName"
        colnames(matched)[2] = "ExtCustName"
        colnames(matched)[3] = "Similarity Score"
      }
      
      if(!is.null(match.s1.s2)){
        colnames(match.s1.s2)[1] = "renCustName"
        colnames(match.s1.s2)[2] = "ExtCustName"
        colnames(match.s1.s2)[3] = "Similarity Score"
      }
      
      match.s1.s2 = rbind(matched, match.s1.s2)
      print(paste("no.of rows processed = ", nrow(match.s1.s2)))
    }
    
  }
  
  colnames(renData)[1] = "renCustName"
  
  match.s1.s2[,3] = round(match.s1.s2[,3],2)
  
  match = merge(x=renData, y=match.s1.s2, by="renCustName", all.x = TRUE)
  
  match
}

#(Internal) Network Suppliers, Critical Industries, CapIq_Match
nwSuppliers = readTable(nwSuppTable)
indMetaData = readTable(indMetaTable)
suppInd = readTable(pIndTable)


#(External) Prospect's Spend File, Meta Data
#condition = paste("Prospect_Id = '", pid, "'",sep="")
prospectMeta = readTable(pMetaTable, commCond)
version = as.character(prospectMeta[,3])
prospectInd = as.character(prospectMeta[,4])
prospect = try(read_excel(fName), silent = TRUE)
if(length(grep("ERROR", toupper(prospect)))){
  appendError(prospect, paste("Reading data from ", fname, sep=""), pTasksTable, pTasksTableColOrder, pid)
}
prospect = as.data.frame(prospect)
prospect$Prospect_ID = as.integer(pid)
prospect$CapIq_Industry = "NA"
prospect$Enablement_Strategy = "NA"
prospect$Match_Status = "NoMatch"
prospect$Critical = "N"
prospect$Spend_USD = 0
prospect$PO_Count = 0
prospect$Invoice_Count = 0
prospect = try(subset(prospect, select = pSpendTableColOrder), silent = TRUE)
if(length(grep("ERROR", toupper(prospect)))){
  appendError(prospect, paste("Ordering the prospect Spend table", sep=""), pTasksTable, pTasksTableColOrder, pid)
}
writeTable(prospect, pSpendTable, upd = TRUE)
#prospect = readTable(pSpendTable, commCond) #read prospect's spend data


#Match Prospect Supplier List against Network
suppMatch = try(aiMatch(unique(nwSuppliers[1]), prospect[2]), silent = TRUE)
if(length(grep("ERROR", toupper(suppMatch)))){
  appendError(suppMatch, paste("Running Match", sep=""), pTasksTable, pTasksTableColOrder, pid)
}

colnames(suppMatch)[1] = colnames(prospect)[2]
colnames(suppMatch)[2] = "Network_Supplier_Name"


#Setting the match confidence score
suppMatch$Match_Status = ifelse(suppMatch$`Similarity Score`>=0.90, "Match", "NoMatch")

#If the version is "Limited" then only enablement Strategy
if(version == "Limited"){
  matchData = suppMatch[,c(1,4)] #Ignore the network name and similarity score
  matchData$Enablement_Strategy[matchData$Match_Status == "Match"] = 'Quick Win'
  matchData$Spend_USD = 0
  matchData$PO_Count = 0
  matchData$Invoice_Count = 0
  matchData$Prospect_ID = pid
  resultData = matchData
} else {
  matchData = try(merge(x=suppMatch[,c(1,4)],y=prospect[,c(1,2,4,5,6)],by=colnames(suppMatch)[1]), silent = TRUE)
  if(length(grep("ERROR", toupper(matchData)))){
    appendError(matchData, paste("Merging Prospect Spend and Match result", sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
  matchData$Spend_USD = as.numeric(as.character(gsub(",","",matchData$Spend_USD)))
  matchData$Enablement_Strategy[matchData$Match_Status == "Match"] = 'Quick Win'
  unMatchData = matchData[is.na(matchData$Enablement_Strategy),]
  umSort = arrange(unMatchData,desc(Spend_USD))
  umSort$cumSpend = cumsum(umSort$Spend_USD)
  umSort$topN = round((umSort$cumSpend/max(umSort$cumSpend))*100,0)
  umSort$Enablement_Strategy[umSort$topN <= 70] = 'Important'
  umSort$Enablement_Strategy[umSort$topN > 90] = 'Small'
  umSort$Enablement_Strategy[umSort$topN > 70 & umSort$topN <=90] = 'Medium'
  umSort$cumSpend=NULL
  umSort$topN=NULL
  matchData = matchData[matchData$Match_Status == 'Match',]
  #Dataset for the 1st chart
  resultData = rbind(matchData, umSort)
  rm(umSort, unMatchData)
}

#Take the prospect supplier list and match them to CapIq using aiMatch function and get their industries
#Here we have randomly allocated capIq industries and used the csv as input

cricIndList = subset(indMetaData, Prospect_Industry == prospectInd)$Critical_Industries
cricIndList = as.vector(cricIndList)
cricIndList = strsplit(cricIndList, ",")
cricIndList = as.data.frame(cricIndList)
colnames(cricIndList)[1] = "CapIq_Industry"
colnames(suppInd)[1] = "Prospect_Supplier_Name"
cricIndList$Critical = "Y"

resultData = try(merge(x=resultData, y=suppInd, by = "Prospect_Supplier_Name"), silent = TRUE)
if(length(grep("ERROR", toupper(resultData)))){
  appendError(resultData, paste("Merging final result with Supplier Industry", sep=""), pTasksTable, pTasksTableColOrder, pid)
}
resultData = try(merge(x=resultData, y=cricIndList, by = "CapIq_Industry", all.x=T), silent = TRUE)
if(length(grep("ERROR", toupper(resultData)))){
  appendError(resultData, paste("Merging final result with Critical Supplier Industry", sep=""), pTasksTable, pTasksTableColOrder, pid)
}
resultData$Critical[is.na(resultData$Critical)] = "N"

#colOrder = c("Prospect_Id", "Prospect_Supplier_Name", "CapIq_Industry", "Spend_USD", "PO_Count", "Invoice_Count", "Enablement_Strategy", "Match_Status", "Critical")
resultData = try(subset(resultData, select = pSpendTableColOrder), silent = TRUE)
if(length(grep("ERROR", toupper(resultData)))){
  appendError(resultData, paste("Ordering the final result table", sep=""), pTasksTable, pTasksTableColOrder, pid)
}

rm(matchData, cricIndList, suppInd, suppMatch)

#condition = paste("Prospect_Id = '", pid, "'",sep="")
deleteRows(pSpendTable, commCond)
writeTable(resultData, pSpendTable, upd = TRUE)


if(version == 'Limited') {
  #condition = paste("Prospect_Id = '", pid, "'",sep="")
  prospectSavings = readTable(pSpendLtd, commCond)
  prospectSavings$Enablement_Strategy = "Quick Win"
  #colOrder = c("Prospect_Id, Enablement_Strategy", "Spend_USD", "PO_Count", "Invoice_Count")
  #prospectSavings = try(subset(prospectSavings, select = pSavingsColOrder), silent = TRUE)
  # if(length(grep("ERROR", toupper(resultData)))){
  #   appendError(resultData, paste("Ordering the savings table", sep=""), pTasksTable, pTasksTableColOrder, pid)
  # }
} else {
  detach("package:RMySQL", unload=TRUE)
  prospectSavings = sqldf(paste("Select distinct Prospect_ID, Enablement_Strategy, Sum(PO_Count) as PO_Count, Sum(Invoice_Count) as Invoice_Count, Sum(Spend_USD) as Spend_USD from resultData where Prospect_ID = ", pid," group by Prospect_ID, Enablement_Strategy", sep=""))
  library(RMySQL)
  # prospectSavings$Prospect_Id = pid
  # prospectSavings$version = version
}

prospectSavings$Prospect_Industry = prospectInd
prospectSavings = try(merge(x=prospectSavings, y=indMetaData[,c(-2)], by="Prospect_Industry", all.x=T), silent = TRUE)
if(length(grep("ERROR", toupper(prospectSavings)))){
  appendError(prospectSavings, paste("Merging Savings table with Industry Meta data", sep=""), pTasksTable, pTasksTableColOrder, pid)
}
prospectSavings$Prospect_Industry = NULL

prospectSavings$Supplier_Compliance_Savings_USD = prospectSavings$Supplier_Compliance_Multiplier*prospectSavings$Spend_USD/(10^2)
prospectSavings$Invoice_Error_Reduction_Savings_USD = prospectSavings$Invoice_Error_Multiplier*prospectSavings$Spend_USD/(10^2)
prospectSavings$PO_Requisition_Transmission_Savings_USD = prospectSavings$PO_Req_and_Trans_Multiplier*prospectSavings$PO_Count/(10^2)
prospectSavings$Invoice_Receipt_Processing_Savings_USD = prospectSavings$Invoice_Receipt_Multiplier*prospectSavings$Invoice_Count/(10^2)

#Remove savings multiplier columns, Critical Industry Columns
prospectSavings = subset(prospectSavings, select = setdiff(pSavingsColOrder,unNecSavingCol))

prospectSavings = try(subset(prospectSavings, select = pSavingsColOrder), silent = TRUE)
if(length(grep("ERROR", toupper(resultData)))){
  appendError(resultData, paste("Ordering the savings table", sep=""), pTasksTable, pTasksTableColOrder, pid)
}

#condition = paste("Prospect_Id = '", pid, "'",sep="")
deleteRows(pSavings, commCond)

writeTable(prospectSavings, pSavings, upd = TRUE)


#Collect the unmatched Suppliers data for Ariba Internal View if Advanced version is selected
if(version == "Advanced"){
detach("package:RMySQL", unload=TRUE)
unMatchSupp = sqldf("Select distinct [Prospect_ID], [Prospect_Supplier_Name], Sum([Spend_USD]) as [Spend_USD], Sum([PO_Count]) as [PO_Count], Sum([Invoice_Count]) as [Invoice_Count], [Enablement_Strategy]
                    from resultData where [Match_Status] = 'NoMatch'
                    group by [Prospect_ID], [Prospect_Supplier_Name], [Enablement_Strategy]")
library(RMySQL)

unMatchSupp$Prospect_Supplier_Name = gsub("'", '', unMatchSupp$Prospect_Supplier_Name)

rec = readTable(SMOTable)

if(nrow(rec)!=0){
  recMatch = try(aiMatch(rec[2],unMatchSupp[2]), silent = TRUE)
  if(length(grep("ERROR", toupper(recMatch)))){
    appendError(recMatch, paste("Matching unmatched suppliers against the already existing unmatched suppliers table", sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
  recMatch = as.data.frame(recMatch)
  s = which(recMatch$`Similarity Score`<0.95)
  if(length(s)==0) {
    recMatch = as.data.frame(recMatch[,2]) #all suppliers already present in unmatched database
  } else {
    recMatchpart1 = recMatch[s,2] #take the supplier names from database for matched suppliers
    diffRows = setdiff(1:nrow(recMatch), s)
    recMatchpart2 = recMatch[diffRows,1] #take the supplier names from the current set for unmatched suppliers
    recMatch = rbind(recMatchpart1, recMatchpart2)
  }
  #recMatch = recMatch[s,]
  #recMatch = subset(recMatch, select = c(1))
  colnames(recMatch)[1] = colnames(unMatchSupp)[2]
  unMatchSupp = try(merge(x = unMatchSupp, y=recMatch, by = colnames(unMatchSupp)[2]), silent = TRUE)
  if(length(grep("ERROR", toupper(unMatchSupp)))){
    appendError(unMatchSupp, paste("Collecting the net new unmatched suppliers for final upload", sep=""), pTasksTable, pTasksTableColOrder, pid)
  }
}


# unMatchSupp$Initial_time_MMM = 'Apr'
# unMatchSupp$Initial_time_YYYY = '2017'
unMatchSupp$Initial_time_MMM = substr(format(Sys.Date(), format = "%B"),1,3)
unMatchSupp$Initial_time_YYY = format(Sys.Date(), format = "%Y")
unMatchSupp$Match_Current_Status = "N"

#Add the Prospect Name
# unMatchSupp = sqldf("Select distinct a.[MM_YYYY], b.[Prospect_Name], a.[Prospect_Supplier_Name], a.[Match_Status], a.[PO], a.[Invoice], a.[Spend_USD], a.[Enablement_Strategy]
#                     from unMatchSupp a inner join prospectMeta b 
#                     on a.Prospect_ID = b.Prospect_ID")



smpVal = try(calSMP(unMatchSupp$PO_Count, unMatchSupp$Invoice_Count, unMatchSupp$Spend_USD), silent = TRUE)

if(length(grep("ERROR", toupper(smpVal)))){
  appendError(smpVal, paste("Calculating SMP Values", sep=""), pTasksTable, pTasksTableColOrder, pid)
}

unMatchSupp$SMP_USD = smpVal

unMatchSupp = try(subset(unMatchSupp, select = SMOTableColOrder), silent = TRUE)
if(length(grep("ERROR", toupper(unMatchSupp)))){
  appendError(unMatchSupp, paste("Ordering the unmatched Suppliers table", sep=""), pTasksTable, pTasksTableColOrder, pid)
}

for (i in 1:nrow(unMatchSupp)) {
  condition = paste("Prospect_ID = ", pid, " and Prospect_Supplier_Name = '", unMatchSupp$Prospect_Supplier_Name[i], "'", sep="")
  rec = readTable(SMOTable, condition)
  if (nrow(rec)==0){
    writeTable(unMatchSupp[i,], SMOTable, upd = TRUE)
  } 
}
#print(nrow(readTable(SMOTable)))
}

taskDone = 1
errMsg = "Run Successful"
errDf = as.data.frame(cbind(pid, "Code Run End", errMsg, taskDone))
colnames(errDf) = pTasksTableColOrder
condition = paste("Prospect_ID = ", pid, sep="")
deleteRows(pTasksTable , condition)
writeTable(errDf, pTasksTable, upd = TRUE)
quit(save = "no")




