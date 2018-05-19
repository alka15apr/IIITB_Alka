library(swirl)
setwd("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Linear Regression\\Multiple linear regression\\swirl excercises")
install_course() #Select the Linear Regression - Data Preparation.swc file after this command

swirl()
housing <- read.csv("housing.csv", stringsAsFactors = FALSE)
View(housing)

str(housing)
housing$radial_highways <- as.factor(housing$radial_highways)
str(housing)
unique(housing)

sum(is.na(housing))

quantile(housing$crime_rate, seq(0,1,0.01))

housing$crime_rate[which(quantile(housing$crime_rate, seq(0,1,0.01))>25.0216600)] <- 25.0216600

quantile(housing$residential_land,seq(0,1,0.01))

housing$residential_land[which(housing$residential_land>45.0)]<-45.0

quantile(housing$nitric_oxides,seq(0,1,0.01))

quantile(housing$weighted_distances,seq(0,1,0.01))

housing$weighted_distances[which(housing$weighted_distances>9.222770)]<-9.222770

quantile(housing$corporate_proportion,seq(0,1,0.01))

housing$corporate_proportion[which(housing$corporate_proportion<229.6060)]<-229.6060


levels(housing$radial_highways)[1:3] <- "near"
str(housing)
levels(housing$radial_highways)[2:4] <- "far"

levels(housing$radial_highways)[3:5] <- "farthest"
str(housing)
View(housing)
dummy <- model.matrix(~radial_highways,-1, data= housing)
dummy<-model.matrix(~radial_highways - 1,data=housing)
dummy <- dummy[,-1]
housing_1<-cbind(housing[,-6], dummy)
View(housing_1)



