#The entire segmentation process can be divided into four parts:
#Take raw data
#Group by dimensions
#Summarise using a relevant metric such as mean, median, etc.
#Compare the aggregated metric across groups/categories

install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
EDA <- read.csv("C:/Users/212488767/Desktop/Data Science training/IIITB/EDA/Univariate Analysis/EDA_nas.csv")
summary(EDA)
str(EDA)
EDA$watch.tv <- as.character(EDA$Watch.TV)
str(EDA)
science <- group_by(EDA$Watch.TV, EDA$science)

#hypothesis testing is used to ascertain whether the difference in means is significant or due to randomness.

#the three steps of segmented univariate analysis are as follows:
#Basis of segmentation
#Comparison of averages
#Comparison of other metrics

#Besides finding the segments and comparing the metrics, your primary focus should be on understanding the results arising from the segments.

Census <- read.csv("C:/Users/212488767/Desktop/Data Science training/IIITB/EDA/Univariate Analysis/EDA_census.csv")

totalfemales <- Census[Census$Age.group=20-24, Census$Total.Females]
