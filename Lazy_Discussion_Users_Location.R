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

###add a new column for saving the Location's Nation
###use the code in Lazy_Discussion_Location_to_Country.R
databases_discuss <- User_info

###create a list store all countries
Country_list <- c("USA","Canada","Mexico","Colombia","Brazil","Argentina","Peru",
                  "Europe","France","Switzerland","UK","Ireland","Finland","Norway",
                  "Sweden","Denmark","Germany","Luxembourg","Poland","Greece",
                  "Belgium","Italy","Netherland","Czech Republic","Lithuania","Romania",
                  "Latvia","Estonia","Hungary","Serbia","Spain","Portugal","Turkey","Cyprus",
                  "Bulgaria","Austria","Russia","Belarus","Ukraine",
                  "India","Pakistan","Iran","Taiwan","China","Hong Kong","Japan",
                  "South Korea","Nepal","Kazakhstan","Banglades","Israel","Dubai",
                  "Malaysia","Singapore","Philippines","Vietnam","Thailand",
                  "Cambodia","Indonesia",
                  "Australia","New Zealand",
                  "Egypt","Uganda","Kenya","Morocco","South Africa")

Country_list_new <- Country_list[Country_list != "Europe"]

### Filter data that can be recognized and categorized by Location.
User_country <- data.frame()
for (coun in Country_list) {
  addlist <- databases_discuss[which(databases_discuss$Country==coun),]
  User_country <- rbind(User_country,addlist)
}

User_country <- data.frame(Id = User_country$Id,Displyname = User_country$DisplayName,
                           Country = User_country$Country)
User_country_new <- User_country[which(User_country$Country!="Europe"),]

### Statistics on the number of Users in each Country
Country_count <- data.frame()
for (coun in Country_list_new) {
  numlist <- list(Country = coun, 
                  numbers_of_users = nrow(User_country_new[which(User_country_new$Country==coun),]) )
  Country_count <- rbind(Country_count,numlist)
}
Country_count<-Country_count[order(Country_count$numbers_of_users,decreasing = TRUE),]
row.names(Country_count) <- 1:nrow(Country_count)
