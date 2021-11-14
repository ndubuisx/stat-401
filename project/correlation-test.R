# load library
library("ggpubr")

PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/cigarette-cancer.csv"
data <- read.csv(PATH)

data <- data %>% na_if("") %>% na.omit

glimpse(data)

# get + plot correlation value
# conf.int = TRUE, cor.coef = TRUE (these assignments would show the corr. value on the plot)
# R is the coefficient value
# cor.method = "pearson" (what correlation method to use)
ggscatter(data, x = "cigarette_sales", y = "death_rate", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Cigarettes Sales per Adult per Day", ylab = "Lung Cancer Mortality Rate per 100,000 people")

# generates correlation value without plotting
# my_data$wt => the dollar sign is used to select the column name (my_data$wt = weight column, my_data$mpg = mpg column)
# in the output, 'cor' is the correlation value
res = cor.test(data$cigarette_sales, data$death_rate, method = "pearson")

# Pearson's product-moment correlation
# 
# data:  data$cigarette_sales and data$death_rate
# t = 0.16798, df = 38, p-value = 0.8675
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.2867024  0.3358988
# sample estimates:
#        cor 
# 0.02723973 
