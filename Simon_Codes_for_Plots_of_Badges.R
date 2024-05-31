load("C:/Users/user/Desktop/碩士班學業/生物數據分析的計算技能/Group Project/Group Project.RData")
library("ggplot2")

#Badges
ggplot(data = Name[1:10,], aes(x = reorder(BadgesName, -COUNT), y = COUNT, fill = BadgesName)) +
  geom_bar(stat = "identity", color = "gray") +   # 設置長條的填充色和邊框色
  labs(title = "All Kinds of Badges",
       x = "Badges Name",
       y = "Count") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 14, color = "black"),    # 調整座標軸文字大小和顏色
    axis.title = element_text(size = 16, color = "darkgray"),   # 調整座標軸標題大小和顏色
    plot.title = element_text(size = 20, color = "black")  # 調整圖表標題大小和顏色
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # 調整 x 軸標籤角度
  guides(fill = FALSE)  # 隱藏圖例

#Badges named by Tags
ggplot(data = `Badges named by Tags`, aes(x = reorder(BadgesName, -COUNT), y = COUNT, fill = BadgesName)) +
  geom_bar(stat = "identity", color = "gray") +   # 設置長條的填充色和邊框色
  labs(title = "Badges named by Tags",
       x = "Badges Name",
       y = "Count") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 14, color = "black"),    # 調整座標軸文字大小和顏色
    axis.title = element_text(size = 16, color = "darkgray"),   # 調整座標軸標題大小和顏色
    plot.title = element_text(size = 20, color = "black")  # 調整圖表標題大小和顏色
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # 調整 x 軸標籤角度
  guides(fill = FALSE)  # 隱藏圖例

#Top 10 Badges
ggplot(data = `Total Badges`[1:10,], aes(x = reorder(Name, -Badges), y = Badges, fill = Name)) +
  geom_bar(stat = "identity", color = "gray") +   # 設置長條的填充色和邊框色
  labs(title = "Top 10 users with Badges",
       x = "Name",
       y = "Badges") +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 14, color = "black"),    # 調整座標軸文字大小和顏色
    axis.title = element_text(size = 16, color = "darkgray"),   # 調整座標軸標題大小和顏色
    plot.title = element_text(size = 20, color = "black")  # 調整圖表標題大小和顏色
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  +  # 調整 x 軸標籤角度
  guides(fill = FALSE)  # 隱藏圖例

# Badges and Reputation
ggplot(data = `Total Badges`, aes(x = Badges, y = Reputation)) +
  geom_point(size = 2, color = "gray") +
  geom_smooth(method = "lm", se = F, col = "brown") +
  #facet_wrap(~ cyl) +
  labs(title = "Badge Number and Reputation",
       x = "Badges",
       y = "Reputation",
       color = "gray") +
  theme_minimal()
cor.test(`Total Badges`$Badges, `Total Badges`$Reputation)

# Badges and UserView
ggplot(data = `Total Badges`, aes(x = Badges, y = UserViews)) +
  geom_point(size = 2, color = "gray") +
  geom_smooth(method = "lm", se = F, col = "brown") +
  #facet_wrap(~ cyl) +
  labs(title = "Badge Number and User View",
       x = "Badges",
       y = "User View",
       color = "gray") +
  theme_minimal()

cor.test(`Total Badges`$Badges, `Total Badges`$UserViews)

# Total Badges and Class 1 Badges
Total_Class1 = merge(`Total Badges`, `Class 1 Badges`[,1:2], by = "Name")

ggplot(data = Total_Class1, aes(x = Badges, y = Class_1_Badges)) +
  geom_point(size = 2, color = "gray") +
  geom_smooth(method = "lm", se = F, col = "gold") +
  #facet_wrap(~ cyl) +
  labs(title = "Total Badges and Golden Badges",
       x = "Total Badges",
       y = "Golden Badges",
       color = "gray") +
  theme_minimal()

cor.test(Total_Class1$Badges, Total_Class1$Class_1_Badges)

save.image("C:/Users/user/Desktop/碩士班學業/生物數據分析的計算技能/Group Project/Group Project.RData")
