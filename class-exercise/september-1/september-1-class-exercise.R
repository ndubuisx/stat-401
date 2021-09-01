# Author: Emmanuel Ndubuisi, Date: September 1, 2021, Purpose: Calculate one-way ANOVA on sample data.

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
