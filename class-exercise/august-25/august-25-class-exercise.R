# Author: Emmanuel Ndubuisi, Date: August 25, 2021, Purpose: Calculate correlation coefficient value.

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

# load library
library("ggpubr")

# get sample data 
my_data = mtcars

# get + plot correlation value
# conf.int = TRUE, cor.coef = TRUE (these assignments would show the corr. value on the plot)
# R is the coefficient value
# cor.method = "pearson" (what correlation method to use)
ggscatter(my_data, x = "mpg", y = "wt", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")

# generates correlation value without plotting
# my_data$wt => the dollar sign is used to select the column name (my_data$wt = weight column, my_data$mpg = mpg column)
# in the output, 'cor' is the correlation value
res = cor.test(my_data$wt, my_data$mpg, method = "pearson")
