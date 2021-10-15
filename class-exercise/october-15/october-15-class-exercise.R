# Author: Emmanuel Ndubuisi, Date: October 15, 2021, Purpose: Create a simple linear regression model

# x = independent variable - height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 

# y = dependent variable (or outcome) - weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# create model using lm()
relation <- lm(y~x)

print(relation)

# Output -->
# Call:
# lm(formula = y ~ x)

# Coefficients:
# (Intercept)            x  
#    -38.4551       0.6746  
