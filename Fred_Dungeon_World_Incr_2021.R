setwd("C:/Users/lisa8/OneDrive/桌面/112-2/生物數據分析的計算技能/Group project RPG")

stall.packages("pacman")
library(pacman)
library(ggplot2)
library(dplyr)

D1 <- read.csv("DW.csv")
p1 <- ggplot(D1, aes(x = Year)) +
  geom_col(aes(y = PostsCounts)) +
  geom_line(aes(y = ViewCounts / 1000)) + 
  scale_y_continuous(
    name = "PostsCounts",
    sec.axis = sec_axis(~ . * 1000, name = "ViewCounts") 
  )

p1

