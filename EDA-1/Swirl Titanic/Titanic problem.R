install.packages("swirl")
library(swirl)
setwd("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\EDA\\Swirl Titanic")
library(swirl)
install_course()
swirl()
install.packages("titanic")
library(titanic)
str(titanic_train)
max(titanic_train$Age,na.rm =T) #the Age of the oldest passenger on board
which.max(titanic_train$Age) #In which row is the oldest passenger present?
row_oldest= which.max(titanic_train$Age)
row_oldest
name_oldestperson <- titanic_train[row_oldest,'Name'] #Name of the oldest person
name_oldestperson
summary(titanic_train)
#convert only one column 'Sex' in titanic_train to factor using the
# function factor(). Store the resulting vector into titanic_train$Sex to replace the
# original column.
titanic_train$Sex <- factor(titanic_train$Sex)

col_names <- c("Survived","Pclass","Sex","SibSp","Parch", "Cabin","Embarked")
columns <-titanic_train[,col_names]
titanic_train[,col_names]<-lapply(columns,factor)#You stored the 7 column names in a vector 'col_names', then
# created a dataframe 'columns' and 'lapply()ied' the function factor on 'columns'
summary(titanic_train)
titanic_train$Survived=="1" #how many had survived (Survived == "1")?

quantile(titanic_train$Age,c(0.4,0.6),na.rm = T)
#40% people were less than or equal to 25 years old; 60% were less than equal to about 32 years old.

library(ggplot2)

ggplot(titanic_train, aes(x = Age)) + geom_histogram()
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

install.packages("stats")
library(stats)
sd(titanic_train$Age,na.rm = TRUE)
#Standard deviation of 14.5 means that the average passenger was about 14 years
#younger or older than the mean age of 29.7.

ggplot(titanic_train, aes(x = Age, fill = Survived)) + geom_histogram()
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
#Recall that only 342/891 (in the sample subset titanic_train) had survived. It is
#still difficult to compare which age group has survived the most. This is where a
#'dodge' chart helps.
#'
ggplot(titanic_train, aes(x = Age, fill = Survived) ) + geom_histogram(position ='dodge'), bin=30
#Lots of 20 to 40 years old passengers died. A few high blue bars between 0 to 10
#years indicate that children were given priority during rescue operations.


ggplot(titanic_train, aes(x =Pclass, fill =Survived) ) + geom_bar()
#Note - y = count is the default setting of geom_bar
#Most passengers belonged to third class, and it seems about 75% of them died (by
#visual inspection). On the contrary, a higher percentage of first class passengers
#survived compared to other classes.

bye()
#Find the number of passengers belonging to class "3" who had survived.
length(which(titanic_train$Survived == "1" & titanic_train$Pclass == "3"))

#correlation between variables can be calculated.
cor(titanic_train$Age, titanic_train$Fare, use = "na.or.complete")

#Correlation = 0.09 means that Age and Fare are not linearly correlated.