installed.packages('odbc")
library(DBI)
library(odbc)



conn <- dbConnect(
  odbc(),
  Driver = "SQL Server", 
  Server = "cloudminorsqlsverdb.database.windows.net,1433",
  Database = "dbprojectsqlsvr",
  UID = "readonlylogin",
  PWD = "@z$q!123!"
)