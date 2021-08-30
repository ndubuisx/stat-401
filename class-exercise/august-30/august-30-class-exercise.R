# Author: Emmanuel Ndubuisi, Date: August 30, 2021, Purpose: Calculate one-way ANOVA in R.

# load dplyr library
library(dplyr)

# get data from github link
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv"

# read CSV file from link
df <- read.csv(PATH) %>% select(-X) %>% mutate(poison = factor(poison, ordered = TRUE))

# check few lines from data frame
glimpse(df)
