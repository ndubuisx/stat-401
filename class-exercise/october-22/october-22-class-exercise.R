# Author: Emmanuel Ndubuisi, Date: October 22, 2021, Purpose: Perform multiple linear regression on sample data

install.packages("tidyverse")
install.packages("datarium")

# load tidyverse library
library(tidyverse)

# load datarium library
library(datarium)

# load the sample data from datarium
# argument 1 = data name in package.
# argument 2 = what package are you getting the data from?
data("marketing", package="datarium")

# check out the data frame
# displays first few lines of dataframe
# tail() -> displays last few lines of dataframe
head(marketing)

# how many rows and column in dataframe?
dim(marketing)

# marketing data description
# the impact of amount of the money spent on advertising on youtube, facebook, messenger on sales
# first argument in lm() is the dependent variable - other variables after "~" are independent
# the last argument specifices the data source 
model <- lm(sales ~ youtube + facebook, data = marketing)
summary(model)

# the intercepts are need to build up the prediction func.
# i.e. sales = intercept + (estimate * youtube) + (estimate * facebook)
# for the output below, sales = 3.5 + 0.04575y + 0.18799f
# Output -->
# Call:
#   lm(formula = sales ~ youtube + facebook, data = marketing)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -10.5572  -1.0502   0.2906   1.4049   3.3994 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.50532    0.35339   9.919   <2e-16 ***
#   youtube      0.04575    0.00139  32.909   <2e-16 ***
#   facebook     0.18799    0.00804  23.382   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.018 on 197 degrees of freedom
# Multiple R-squared:  0.8972,	Adjusted R-squared:  0.8962 
# F-statistic: 859.6 on 2 and 197 DF,  p-value: < 2.2e-16
