# Author: Emmanuel Ndubuisi, Date: September 1, 2021, Purpose: Calculate ANOVA on sample data.

# load dplyr library
library(dplyr)

# get data from github link
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv"

# read CSV file from link
df <- read.csv(PATH) %>% select(-X) %>% mutate(poison = factor(poison, ordered = TRUE))

# check few lines from data frame
glimpse(df)

# check the levels of variables "poison"
# levels only works for numerical values (ordinal or int values)
levels(df$poison)

# "%>%" this symbol is used to take input from left and feed it to the right expression
# na.rm is used remove the values of missing data
df %>% group_by(poison) %>% summarise(count_poison = n(), mean_time = mean(time, na.rm = TRUE), sd_time = sd(time, na.rm = TRUE))

# plotting the data using ggplot2
install.packages("ggplot2")
library(ggplot2)

ggplot(df, aes(x = poison, y = time, fill = poison)) + geom_boxplot() + geom_jitter(shape = 15, color = "steelblue", position = position_jitter(0.21)) + theme_classic()

anova_one_way <- aov(time~poison, data = df)

summary(anova_one_way)
