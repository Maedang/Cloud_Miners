#To connect on-premises R Studio to an Azure SQL database, you can follow these steps:

#Install the odbc package
install.packages("odbc")

#load the odbc package
library(odbc)

#Set up a connection string using the connection details of your Azure SQL database
conn <- dbConnect(
  odbc(),
  Driver = "SQL Server", 
  Server = "cloudminorsqlsverdb.database.windows.net,1433",
  Database = "dbprojectsqlsvr",
  UID = "readonlylogin",
  PWD = "@z$q!123!"
)

#Test the connection by running a simple query
result <- dbGetQuery(conn, "SELECT TOP (1000) * FROM [dbo].[SptfyWWDSongRanking]")

head(result)
result$POSITION

qf(0.95, 4,27)

qt(0.975, 44)


