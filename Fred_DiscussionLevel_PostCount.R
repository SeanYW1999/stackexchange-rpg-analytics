setwd("C:/Users/lisa8/OneDrive/桌面/112-2/生物數據分析的計算技能/Group project RPG")
read.csv("Discussion_level.csv")
D <- read.csv("Discussion_level.csv")
str(D)

install.packages("pacman")
library(pacman)
library(ggplot2)
library(dplyr)

### PostsCounts_all ###        
p1 <- ggplot(D,
             aes(x = Year, y = PostsCounts, group = GameName, colour = GameName))+
  geom_line()
p1

### PostsCounts_low_6 ###
D2 <- D[c(11:45), ]
p2 <- ggplot(D2,
             aes(x = Year, y = PostsCounts, group = GameName, colour = GameName))+
  geom_line()
p2

