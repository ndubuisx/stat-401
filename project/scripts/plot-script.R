# load libraries
library(ggplot2)
library(dplyr)
library(patchwork)
library(hrbrthemes)
theme_set(theme_bw())

# path to dataset
PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/data/cancer-cigarette.csv"
data <- read.csv(PATH)

# factors used to scale the data
coeff_men <- 10
coeff_women <- 5

cigarette_sales_color <- "#0047AB"
mortality_rate_men_color <- "#D22B2B"

cigarette_sales_color <- "#0047AB"
mortality_rate_women_color <- "#D22B2B"

# preview data frame
glimpse(data)

# plot data frame for men
ggplot(data, aes(x=year)) + 
  xlab("Year") +
  geom_line(aes(y=cigarette_sales), size=1, color=cigarette_sales_color) + 
  geom_line(aes(y=mortality_rate_men / coeff_men), size=1, color=mortality_rate_men_color) +
  scale_y_continuous(name = "Cigarettes Sales per Adult per Day", sec.axis = sec_axis(~.*coeff_men, name="Lung Cancer Mortality Rate per 100,000 Males")) + 
  theme(axis.title.y = element_text(color = cigarette_sales_color, size=13), axis.title.y.right = element_text(color = mortality_rate_men_color, size=13)) +
  ggtitle("Cigarette Sales and Male Lung Cancer Mortality Rate in the United States.")

# plot data frame for women
ggplot(data, aes(x=year)) + 
  xlab("Year") +
  geom_line(aes(y=cigarette_sales), size=1, color=cigarette_sales_color) + 
  geom_line(aes(y=mortality_rate_women / coeff_women), size=1, color=mortality_rate_women_color) +
  scale_y_continuous(name = "Cigarettes Sales per Adult per Day", sec.axis = sec_axis(~.*coeff_women, name="Lung Cancer Mortality Rate per 100,000 Females")) + 
  theme(axis.title.y = element_text(color = cigarette_sales_color, size=13), axis.title.y.right = element_text(color = mortality_rate_women_color, size=13)) +
  ggtitle("Cigarette Sales and Female Lung Cancer Mortality Rate in the United States.")
