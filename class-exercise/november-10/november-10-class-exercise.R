# Author: Emmanuel Ndubuisi, Date: November 10, 2021, Purpose: Calculate chi-square value on sample data.

# read the data from link
data_frame <- read.csv("https://goo.gl/j6lRXD")

# observe the data to check if there is any relationship between treatment and outcomes
table(data_frame$treatment, data_frame$improvement)

# perform the chi-square test
chisq.test(data_frame$treatment, data_frame$improvement, correct=FALSE)
