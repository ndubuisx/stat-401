# load required libraries
library(ggplot2)
library(dplyr)
library(patchwork)
library(hrbrthemes)
theme_set(theme_bw())

# path to dataset
PATH <- "https://raw.githubusercontent.com/ndubuisx/stat-401/main/project/cigarette-cancer.csv"
data <- read.csv(PATH)

# value used to transform the data
coeff <- 7

cigarette_sales_color <- "#0047AB"
new_cases_color <- "#D22B2B"

# preview data set
glimpse(data)

# plot data frame
ggplot(data, aes(x=year)) + 
geom_line( aes(y=cigarette_sales), size=1, color=cigarette_sales_color) + 
geom_line( aes(y=new_cases / coeff), size=1, color=new_cases_color) +
scale_y_continuous(name = "Sales of Cigarettes per Adult per Day", sec.axis = sec_axis(~.*coeff, name="Lung Cancer Rate per 100,000 people")) + 
theme(axis.title.y = element_text(color = cigarette_sales_color, size=13), axis.title.y.right = element_text(color = new_cases_color, size=13)) +
ggtitle("Cigarette Sales and Lung Cancer Rate in the United States.")
