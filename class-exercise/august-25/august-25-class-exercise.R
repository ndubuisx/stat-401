# Author: Emmanuel Ndubuisi, Date: August 25, 2021, Purpose: Calculate correlation coefficient value.

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

# load library
library("ggpubr")

# get sample data 
my_data = mtcars

# get + plot correlation value
# conf.int = TRUE, cor.coef = TRUE (these assignments would show the corr. value on the plot)
# cor.method = "pearson" (what correlation method to use)
ggscatter(my_data, x = "mpg", y = "wt", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")
