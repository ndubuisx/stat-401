library("ggpubr")

PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/cancer-cigarette.csv"
data <- read.csv(PATH)

data <- data %>% na_if("") %>% na.omit

glimpse(data)

ggscatter(data, x = "cigarette_sales", y = "mortality_rate_men", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Cigarettes Sales per Adult per Day", ylab = "Lung Cancer Mortality Rate per 100,000 Males")

res = cor.test(data$cigarette_sales, data$mortality_rate_men, method = "pearson")

print(res)

# Pearson's product-moment correlation
# 
# data:  data$cigarette_sales and data$mortality_rate_men
# t = 1.1991, df = 80, p-value = 0.234
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.08663521  0.34007153
# sample estimates:
#       cor 
# 0.1328699 
