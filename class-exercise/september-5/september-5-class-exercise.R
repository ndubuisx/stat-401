# install packages
install.packages("ggplot2")
install.packages("dplyr")

# load dplyr library
library(dplyr)

# load ggplot2 library
library(ggplot2)

# get data from github link
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/poisons.csv"

# read CSV file from link
# factors are variables which take on a limited number of different values
# factor() would change <int> data type to <ord>
# "ordered = TRUE" implies that the levels can be arranged in ascending or descending order
# mutate() is used to create a new variable (and preserves existing ones) from a data set
df <- read.csv(PATH) %>% select(-X) %>% mutate(poison = factor(poison, ordered = TRUE))

# check few lines from data frame
glimpse(df)

# check the levels of variables "poison"
# levels only works for numerical values (ordinal or int values)
levels(df$poison)

# "%>%" this symbol is used to take input from left and feed it to the right expression
# na.rm is used remove the values of missing data
# each argument in summarise() represents a column
df %>% group_by(poison) %>% summarise(count_poison = n(), mean_time = mean(time, na.rm = TRUE), sd_time = sd(time, na.rm = TRUE))

# plotting the data using ggplot2
ggplot(df, aes(x = poison, y = time, fill = poison)) + geom_boxplot() + geom_jitter(shape = 15, color = "steelblue", position = position_jitter(0.21)) + theme_classic()

anova_one_way <- aov(time~poison, data = df)

summary(anova_one_way)

# diff = difference (the magnitude of this number represents the magnitude of the difference)
# lwr = lower bound
# upr = upper bound
# p adj = p adjusted value (if the p adjusted value is more, then there is more diff. between the groups)
TukeyHSD(anova_one_way)
