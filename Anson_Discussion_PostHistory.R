# Input data
Order_all <- read.csv("/Users/anson/Desktop/Order_all.csv") # without categorization
Order_1 <- read.csv("/Users/anson/Desktop/Order_1.csv") # PostHistoryTypeId = 1
Order_less_3 <- read.csv("/Users/anson/Desktop/Order_less_3.csv") # PostHistoryTypeId < 3
Order_more_3 <- read.csv("/Users/anson/Desktop/Order_more_3.csv") # PostHistoryTypeId > 3
Order_1_2 <- read.csv("/Users/anson/Desktop/Order_1_2.csv") # PostHistoryTypeId = 1 or 2
Order_1_2_10 <- read.csv("/Users/anson/Desktop/Order_1_2_10.csv") # Top 10 when PostHistoryTypeId = 1 or 2
Order_2 <- read.csv("/Users/anson/Desktop/Order_2.csv") # PostHistoryTypeId = 2
Order_2_10 <- read.csv("/Users/anson/Desktop/Order_2_10.csv") # Top 10 when PostHistoryTypeId = 2

# Plotting: scatter plot & bar plot
install.packages("ggplot2")
library(ggplot2)

# Order_less_3, x = Post_counts_per_user, y = Reputation
ggplot(Order_less_3, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (PostHistoryTypeId < 3)",
       x = "Post Counts per User",
       y = "Reputation")

model <- lm(Reputation ~ Post_counts_per_user, data = Order_less_3)
summary(model) # Multiple R-squared:  0.8371,	Adjusted R-squared:  0.8371

# Order_less_3, x = Post_counts_per_user, y = Views
ggplot(Order_less_3, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (PostHistoryTypeId < 3)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_less_3)
summary(model) # Multiple R-squared:  0.562,	Adjusted R-squared:  0.562 

# Order_all, x = Post_counts_per_user, y = Views
ggplot(Order_all, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (all)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_all)
summary(model) # Multiple R-squared:  0.6884,	Adjusted R-squared:  0.6884

# Order_all, x = Post_counts_per_user, y = Reputation
ggplot(Order_all, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (all)",
       x = "Post Counts per User",
       y = "Reputation")

model <- lm(Reputation ~ Post_counts_per_user, data = Order_all)
summary(model) # Multiple R-squared:  0.4534,	Adjusted R-squared:  0.4533

# Order_1, x = Post_counts_per_user, y = Reputation
ggplot(Order_1, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (PostHistoryTypeId = 1)",
       x = "Post Counts per User",
       y = "Reputation")

model <- lm(Reputation ~ Post_counts_per_user, data = Order_1)
summary(model) # Multiple R-squared:  0.2612,	Adjusted R-squared:  0.2612

# Order_1, x = Post_counts_per_user, y = Views
ggplot(Order_1, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (PostHistoryTypeId = 1)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_1)
summary(model) # Multiple R-squared:  0.2486,	Adjusted R-squared:  0.2485

# Order_more_3, x = Post_counts_per_user, y = Views
ggplot(Order_more_3, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (PostHistoryTypeId > 3)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_more_3)
summary(model) # Multiple R-squared:  0.598,	Adjusted R-squared:  0.598 

# Order_more_3, x = Post_counts_per_user, y = Reputation
ggplot(Order_more_3, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (PostHistoryTypeId > 3)",
       x = "Post Counts per User",
       y = "Reputation")

model <- lm(Reputation ~ Post_counts_per_user, data = Order_more_3)
summary(model) # Multiple R-squared:  0.311,	Adjusted R-squared:  0.3109 

# Order_1_2, x = Post_counts_per_user, y = Reputation
ggplot(Order_1_2, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (PostHistoryTypeId = 1 or 2)",
       x = "Post Counts per User",
       y = "Reputation")

model <- lm(Reputation ~ Post_counts_per_user, data = Order_1_2)
summary(model) # Multiple R-squared:  0.888,	Adjusted R-squared:  0.888

# Order_1_2, x = Post_counts_per_user, y = View
ggplot(Order_1_2, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (PostHistoryTypeId = 1 or 2)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_1_2)
summary(model) # Multiple R-squared:  0.5848,	Adjusted R-squared:  0.5848

# Order_2, x = Post_counts_per_user, y = Reputation
ggplot(Order_2, aes(x = Post_counts_per_user, y = Reputation)) +
  geom_point(alpha = 0.1) + # change the value of transparent
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Reputation (PostHistoryTypeId = 2)",
       x = "Post Counts per User",
       y = "Reputation")+
  theme(panel.background = element_rect(fill = "gray95"))

model <- lm(Reputation ~ Post_counts_per_user, data = Order_2)
summary(model) # Multiple R-squared:  0.9241,	Adjusted R-squared:  0.9241 

# Order_2, x = Post_counts_per_user, y = View
ggplot(Order_2, aes(x = Post_counts_per_user, y = Views)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(method = "lm", se = TRUE, color = "firebrick") +
  labs(title = "Post Counts vs Views (PostHistoryTypeId = 2)",
       x = "Post Counts per User",
       y = "Views")

model <- lm(Views ~ Post_counts_per_user, data = Order_2)
summary(model) # Multiple R-squared:  0.5831,	Adjusted R-squared:  0.583


# Top 10 when PostHistoryTypeId = 2
# Sort the data frame by Post_counts_per_user in descending order
data <- Order_2_10[order(Order_2_10$Post_counts_per_user, decreasing = TRUE),]

# Convert DisplayName to a factor to keep the sorted order
data$DisplayName <- factor(data$DisplayName, levels = data$DisplayName)


# Maximum values
max_post_counts <- max(data$Post_counts_per_user)
max_reputation <- max(data$Reputation)

# Create the dual-axis plot
ggplot(data, aes(x = DisplayName)) +
  geom_bar(aes(y = Post_counts_per_user, fill = DisplayName), stat = "identity") +
  geom_line(aes(y = Reputation / max_reputation * max_post_counts, group = 1), 
            color = "royalblue2", size = 1) + # Create line plot for normalized Reputation
  geom_point(aes(y = Reputation / max_reputation * max_post_counts), 
             color ="midnightblue", size = 2) + # Add points for normalized Reputation
  scale_y_continuous(
    name = "Post Counts per User",
    sec.axis = sec_axis(~ . * max_reputation / max_post_counts, name = "Reputation")  # Secondary y-axis transformation and label
  ) +
  labs(title = "Top 10 Users with post counts and reputation (PostHistoryTypeId = 2)",
       x = "User Name") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + # Rotate x-axis labels for better readability
  theme(legend.position = "none")
