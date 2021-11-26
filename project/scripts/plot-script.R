# load libraries
library(ggplot2)
library(dplyr)
theme_set(theme_bw())

# path to dataset
PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/data/cancer-cigarette.csv"
data <- read.csv(PATH)

# factors used to scale the data
coeff_men <- 10
coeff_women <- 5

blue <- "#0047AB"
red <- "#D22B2B"

# preview data frame
glimpse(data)

# plot cigarrete sales and male lung cancer mortality rate
ggplot(data, aes(x=year)) + 
  xlab("Year") +
  geom_line(aes(y=cigarette_sales), size=1, color=blue) + 
  geom_line(aes(y=mortality_rate_men / coeff_men), size=1, color=red) +
  scale_y_continuous(name = "Cigarettes Sales per Adult per Day", sec.axis = sec_axis(~.*coeff_men, name="Lung Cancer Mortality Rate per 100,000 Males")) + 
  theme(axis.title.y = element_text(color = blue, size=13), axis.title.y.right = element_text(color = red, size=13)) +
  ggtitle("Cigarette Sales and Male Lung Cancer Mortality Rate in the United States.")

# plot cigarrete sales and female lung cancer mortality rate
ggplot(data, aes(x=year)) + 
  xlab("Year") +
  geom_line(aes(y=cigarette_sales), size=1, color=blue) + 
  geom_line(aes(y=mortality_rate_women / coeff_women), size=1, color=red) +
  scale_y_continuous(name = "Cigarettes Sales per Adult per Day", sec.axis = sec_axis(~.*coeff_women, name="Lung Cancer Mortality Rate per 100,000 Females")) + 
  theme(axis.title.y = element_text(color = blue, size=13), axis.title.y.right = element_text(color = red, size=13)) +
  ggtitle("Cigarette Sales and Female Lung Cancer Mortality Rate in the United States.")

# plot lung cancer mortality rate in males and females
ggplot(data, aes(x=year)) + 
  xlab("Year") +
  geom_line(aes(y=mortality_rate_men), size=1, color=blue) + 
  geom_line(aes(y=mortality_rate_women), size=1, color=red) +
  scale_y_continuous(name = "Lung Cancer Mortality Rate per 100,000 Males", sec.axis = sec_axis(~.*1, name="Lung Cancer Mortality Rate per 100,000 Females")) + 
  theme(axis.title.y = element_text(color = blue, size=13), axis.title.y.right = element_text(color = red, size=13)) +
  ggtitle("Lung Cancer Mortality Rate per 100,000 Males and Females in the United States.")
