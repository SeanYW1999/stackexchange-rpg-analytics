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
############################# Distribute players to their Continents #################################################
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

### Statistics the 8 games player total number across 5 Continents
continent <- c("Americas","Europe","Asia","Oceania","Africa")
count <-c(nrow(Americas),nrow(Europe),nrow(Asia),nrow(Oceania),nrow(Africa))
Continent_Player <- data.frame(continent,number_of_users = count)
Continent_Player<-Continent_Player[order(Continent_Player$number_of_users,decreasing = TRUE),]
row.names(Continent_Player) <- 1:nrow(Continent_Player)

############################# Statistic 8 games player number in 5 Continents #################################################
### Statistics on the number of players playing each of the 8 games in the 5 continents
###Americas
games <- unique(playerlist$Tags)
games_Am <- data.frame()
for (g in games) {
  gamelist <- list(Game = g, 
                  Player_number = nrow(Americas[which(Americas$Tags==g),]) )
  games_Am <- rbind(games_Am,gamelist)
}
games_Am<-games_Am[order(games_Am$Player_number,decreasing = TRUE),]
row.names(games_Am) <- 1:nrow(games_Am)

###Europe
games_Eu <- data.frame()
for (g in games) {
  gamelist <- list(Game = g, 
                   Player_number = nrow(Europe[which(Europe$Tags==g),]) )
  games_Eu <- rbind(games_Eu,gamelist)
}
games_Eu<-games_Eu[c(1,2,8,7,3,4,5,6),]
row.names(games_Eu) <- 1:nrow(games_Eu)

###Asia
games_Asia <- data.frame()
for (g in games) {
  gamelist <- list(Game = g, 
                   Player_number = nrow(Asia[which(Asia$Tags==g),]) )
  games_Asia <- rbind(games_Asia,gamelist)
}
games_Asia<-games_Asia[c(1,2,8,7,3,4,5,6),]
row.names(games_Asia) <- 1:nrow(games_Asia)

###Oceania
games_Oc <- data.frame()
for (g in games) {
  gamelist <- list(Game = g, 
                   Player_number = nrow(Oceania[which(Oceania$Tags==g),]) )
  games_Oc <- rbind(games_Oc,gamelist)
}
games_Oc<-games_Oc[c(1,2,8,7,3,4,5,6),]
row.names(games_Oc) <- 1:nrow(games_Oc)

###Africa
games_Af <- data.frame()
for (g in games) {
  gamelist <- list(Game = g, 
                   Player_number = nrow(Africa[which(Africa$Tags==g),]) )
  games_Af <- rbind(games_Af,gamelist)
}
games_Af<-games_Af[c(1,2,8,7,3,4,5,6),]
row.names(games_Af) <- 1:nrow(games_Af)

################################ code for drawing pie plot ##################################################
###America player
percentages_Am <- round(games_Am$Player_number / sum(games_Am$Player_number) * 100,2)
labels_Am <- paste(games_Am$Game, percentages_Am, "%", sep = " ")
colors <- rainbow(length(games_Am$Player_number))
pie(games_Am$Player_number, labels = labels_Am, col = colors, main = "Percentage of Players in the Americas by Games")

###Europe player
percentages_Eu <- round(games_Eu$Player_number / sum(games_Eu$Player_number) * 100,2)
labels_Eu <- paste(games_Eu$Game, percentages_Eu, "%", sep = " ")
colors <- rainbow(length(games_Eu$Player_number))
pie(games_Eu$Player_number, labels = labels_Eu, col = colors, main = "Percentage of Players in the Europe by Games")

###Asia player
percentages_Asia <- round(games_Asia$Player_number / sum(games_Asia$Player_number) * 100,2)
labels_Asia <- paste(games_Asia$Game, percentages_Asia, "%", sep = " ")
colors <- rainbow(length(games_Asia$Player_number))
pie(games_Asia$Player_number[games_Asia$Player_number > 0], labels = labels_Asia[games_Asia$Player_number > 0],
    col = colors,
    main = "Percentage of Players in the Asia by Games")

###Oceania player
percentages_Oc <- round(games_Oc$Player_number / sum(games_Oc$Player_number) * 100,2)
labels_Oc <- paste(games_Oc$Game, percentages_Oc, "%", sep = " ")
colors <- rainbow(length(games_Oc$Player_number))
pie(games_Oc$Player_number[games_Oc$Player_number > 0], labels = labels_Oc[games_Oc$Player_number > 0],
    col = colors,
    main = "Percentage of Players in the Oceania by Games")

###Africa player
percentages_Af <- round(games_Af$Player_number / sum(games_Af$Player_number) * 100,2)
labels_Af <- paste(games_Af$Game, percentages_Af, "%", sep = " ")
colors <- rainbow(length(games_Af$Player_number))
pie(games_Af$Player_number[games_Af$Player_number > 0], labels = labels_Af[games_Af$Player_number > 0],
    col = colors,
    main = "Percentage of Players in the Africa by Games")

