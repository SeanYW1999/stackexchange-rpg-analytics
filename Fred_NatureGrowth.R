setwd("C:/Users/lisa8/OneDrive/桌面/112-2/生物數據分析的計算技能/Group project RPG")
read.csv("NG.csv")
D <- read.csv("NG.csv")

stall.packages("pacman")
library(pacman)
library(ggplot2)
library(dplyr)

p1 <- ggplot(D,
             aes(x = Year, y = Natural_Growth_of_User))+
  geom_line()
p1
