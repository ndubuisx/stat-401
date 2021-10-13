# Author: Emmanuel Ndubuisi, Date: October 13, 2021, Purpose: Create a simple linear regression model

# Question: Test if happiness increases with facebook usage or vice-versa.
# x = independent variable - facebook usage
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# y = dependent variable (or outcome) - happiness ranked on scale 0 - 10
y <- c(1, 2, 9, 3, 4, 5, 7, 2, 2, 8)

# create model using lm()
relation <- lm(y~x)

print(relation)

# Output -->

# Call:
# lm(formula = y ~ x)

# Coefficients:
# (Intercept)            x  
#   11.79499     -0.04873  

# y/Happyness = 11.79499 + (-0.04873 * x/time)
