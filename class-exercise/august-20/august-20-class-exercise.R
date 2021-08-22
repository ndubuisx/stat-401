# Author: Emmanuel Ndubuisi, Date: 08/20/2021 and Purpose: Calculate T-test.

x = rnorm(10)
y = rnorm(10)

pts = seq(-4.5,4.5,length=100)
plot(pts,dt(pts,df=9),col='red',type='l')

lines(density(x), col='green')
lines(density(y), col='blue')

# calculate t-test for group x & y
ttest = t.test(x,y)

# Result after running the ttest on line 13

# Welch Two Sample t-test
# 
# data:  x and y
# t = -0.56445, df = 17.92, p-value = 0.5794
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -1.3142656  0.7577583
# sample estimates:
#   mean of x  mean of y 
# 0.09359484 0.37184849 
