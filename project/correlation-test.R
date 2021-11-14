# load library
library("ggpubr")

PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/cigarette-cancer.csv"
data <- read.csv(PATH)

data <- data %>% na_if("") %>% na.omit

glimpse(data)

ggscatter(data, x = "cigarette_sales", y = "new_cases", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "spearman", xlab = "Cigarettes Sales per Adult per Day", ylab = "Lung Cancer Rate per 100,000 People")

res = cor.test(data$cigarette_sales, data$new_cases, method = "spearman")

print(res)

# Spearman's rank correlation rho
# 
# data:  data$cigarette_sales and data$new_cases
# S = 8981.4, p-value = 0.3319
# alternative hypothesis: true rho is not equal to 0
# sample estimates:
#       rho 
# 0.1574626 
