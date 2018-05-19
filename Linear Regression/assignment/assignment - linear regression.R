install.packages("MASS")
install.packages("car")

car <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Linear Regression\\assignment\\CarPrice_Assignment.csv")

View(car)
dim(car)

str(car)

car$CarName <- as.character(car$CarName)
str(car)

# We need to consider only car company name as the independent variable for the model building
car$CarName <- strsplit(car$CarName, " ")

#Creating seperate column Car_company 
car$car_company<-sapply(car$CarName,function(x) x[1])

# checking for #NAs
colSums(is.na(car))

#exploring the data





