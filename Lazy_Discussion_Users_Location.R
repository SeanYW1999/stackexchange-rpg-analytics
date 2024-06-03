###connect sql to R
install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

connect <- DBI::dbConnect(RMySQL::MySQL(), dbname = "",
                          host = "",
                          post =  ,
                          username = "", password = "")
dbListTables(connect)

###insert dataset we need in discussion
User_info <- dbGetQuery(connect,"SELECT Id,
                                        DisplayName,
                                        Location 
                                 FROM Users
                                 WHERE Location IS NOT NULL AND Id > 0;")
