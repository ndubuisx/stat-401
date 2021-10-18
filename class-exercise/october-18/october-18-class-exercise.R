# Author: Emmanuel Ndubuisi, Date: October 18, 2021, Purpose: Simple linear regression analysis

# import dependent and independent variables
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 

y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# create model using lm()
# predict y based on x
relation <- lm(y~x)

print(relation)

# generate a prediction function

# y/weight = -38.4551 + (0.6746 * x/height)

# set working directory to desktop
setwd("/Users/ndubuisi/Desktop")

# give the chart a file name
# this intiates a "writer"
# plot() would write to this file
png(file="linear-regression.png")

# plot the chart
# abline = line of best fit
# cex = font size
# pch = dot size for data points
plot(y, x, col = "blue", main = "Height & Weight Regression Analysis", abline(lm(y~x)), cex = 1.3, pch = 16, xlab = "Weight in kg", ylab = "Height in cm")

# save the file or closes the writing
dev.off()
