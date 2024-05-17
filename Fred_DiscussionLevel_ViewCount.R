setwd("C:/Users/lisa8/OneDrive/桌面/112-2/生物數據分析的計算技能/Group project RPG")
D <- read.csv("Discussion_level.csv")
str(D)

install.packages("pacman")
library(pacman)
library(ggplot2)
library(dplyr)

? ggplot()

p1 <- ggplot(D,
             aes(x = Year, y = ViewCounts, group = GameName, colour = GameName))+
  geom_line()
p1

### ViewCounts > 10,000,000 ###
D2 <- D[1:5, ]
p2 <- ggplot(D2,
             aes(x = Year, y = ViewCounts, group = GameName, colour = GameName))+
  geom_line()
p2

### ViewCounts > 9,000,000 ###
D3 <- D[6:10, ]
p3 <- ggplot(D3,
             aes(x = Year, y = ViewCounts, group = GameName, colour = GameName))+
  geom_line()
p3

### ViewCounts < 9,000,000 ###
D4 <- D[11:40, ]
p4 <- ggplot(D4,
             aes(x = Year, y = ViewCounts, group = GameName, colour = GameName))+
  geom_line()
p4
