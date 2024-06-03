###connect sql to R
install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

connect <- DBI::dbConnect(RMySQL::MySQL(), dbname = "",
                          host = "",
                          post = ,
                          username = "", password = "")
dbListTables(connect)

############################ data set part ################################################################
###insert dataset we need in discussion
###dnd playerlist
dnd_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'dnd|dungeons-and-dragons'
GROUP BY Users.Id;")
dnd_playerlist[,3] <- "dnd"

###pathfinder playerlist
pathfinder_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'PathFinder'
GROUP BY Users.Id;")
pathfinder_playerlist[,3] <- "pathfinder"

###world-of-darkness playerlist
wfd_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'world-of-darkness'
GROUP BY Users.Id;")
wfd_playerlist[,3] <- "world-of-darkness"

###chronicles-of-darkness playerlist
cfd_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'chronicles-of-darkness'
GROUP BY Users.Id;")
cfd_playerlist[,3] <- "chronicles-of-darkness"

###vampire-the-masquerade playerlist
vtm_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'vampire-the-masquerade'
GROUP BY Users.Id;")
vtm_playerlist[,3] <- "vampire-the-masquerade"

###mutants-and-masterminds playerlist
mam_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'mutants-and-masterminds'
GROUP BY Users.Id;")
mam_playerlist[,3] <- "mutants-and-masterminds"

###dungeon-world playerlist
dw_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'dungeon-world'
GROUP BY Users.Id;")
dw_playerlist[,3] <- "dungeon-world"

###shadowrun playerlist
shadowrun_playerlist <- dbGetQuery(connect,
"SELECT Users.Id,
       Users.Location,
       Posts.Tags 
FROM Posts
JOIN Users
ON Posts.OwnerUserId = Users.Id
WHERE Users.Location IS NOT NULL AND Users.Id > 0
  AND Posts.Tags REGEXP 'shadowrun'
GROUP BY Users.Id;")
shadowrun_playerlist[,3] <- "shadowrun"

###combine all playerlist
playerlist<- rbind(dnd_playerlist,pathfinder_playerlist,wfd_playerlist,cfd_playerlist,
                   vtm_playerlist,mam_playerlist,dw_playerlist,shadowrun_playerlist)
nrow(playerlist)
##############################################################################################################
###add a new column for saving the Location's Nation
###use the code in Lazy_Discussion_Location_to_Country.R
databases_discuss <- playerlist

###save the data.frame through Lazy_Discussion_Location_to_Country.R into playerlist
playerlist <- data.frame(Id = databases_discuss$Id,Tags = databases_discuss$Tags,
                           Country = databases_discuss$Country)
###delect the data whose Country == NA
playerlist <- playerlist[!is.na(playerlist$Country),]

### Distribute players to their Continents
###Americas playerlist
Americas <- data.frame()
for (coun in Americas_list) {
  addlist <- playerlist[which(playerlist$Country==coun),]
  Americas <- rbind(Americas,addlist)
}

###Europe playerlist
Europe <- data.frame()
for (coun in Europe_list) {
  addlist <- playerlist[which(playerlist$Country==coun),]
  Europe <- rbind(Europe,addlist)
}

###Asia playerlist
Asia <- data.frame()
for (coun in Asia_list) {
  addlist <- playerlist[which(playerlist$Country==coun),]
  Asia <- rbind(Asia,addlist)
}

###Oceania playerlist
Oceania <- data.frame()
for (coun in Oceania_list) {
  addlist <- playerlist[which(playerlist$Country==coun),]
  Oceania <- rbind(Oceania,addlist)
}

###Africas playerlist
Africa <- data.frame()
for (coun in Africa_list) {
  addlist <- playerlist[which(playerlist$Country==coun),]
  Africa <- rbind(Africa,addlist)
}
