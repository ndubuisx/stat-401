library("ggpubr")

PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/data/cancer-cigarette.csv"
data <- read.csv(PATH)

# remove rows with empty cells
data <- data %>% na_if("") %>% na.omit

# preview data
glimpse(data)

# scatter plot cigarette_sales and mortality_rate_men
ggscatter(data, x = "cigarette_sales", y = "mortality_rate_men", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Cigarettes Sales per Adult per Day", ylab = "Lung Cancer Mortality Rate per 100,000 Males")

# scatter plot cigarette_sales and mortality_rate_women
ggscatter(data, x = "cigarette_sales", y = "mortality_rate_women", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Cigarettes Sales per Adult per Day", ylab = "Lung Cancer Mortality Rate per 100,000 Females")

# pearson correlation test for cigarette_sales and mortality_rate_men
cor_test_men = cor.test(data$cigarette_sales, data$mortality_rate_men, method = "pearson")

# pearson correlation test for cigarette_sales and mortality_rate_women
cor_test_women = cor.test(data$cigarette_sales, data$mortality_rate_women, method = "pearson")

print(cor_test_men)
print(cor_test_women)

### Correlation Test - Cigarette Sales and Male Lung Cancer Mortality Rate ###

# 	Pearson's product-moment correlation
# data:  data$cigarette_sales and data$mortality_rate_men
# t = 1.1991, df = 80, p-value = 0.234
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.08663521  0.34007153
# sample estimates:
#       cor 
# 0.1328699 


### Correlation Test - Cigarette Sales and Female Lung Cancer Mortality Rate ###

# 	Pearson's product-moment correlation
# data:  data$cigarette_sales and data$mortality_rate_women
# t = -4.2845, df = 80, p-value = 5.061e-05
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  -0.5933925 -0.2372516
# sample estimates:
#        cor 
# -0.4320162 