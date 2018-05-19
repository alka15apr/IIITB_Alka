#Multiple Linear Regression
setwd("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Linear Regression\\Multiple linear regression")
advertisement1<-read.csv("advertising.csv")

#Examine the data
View(advertisement1)

# Check the structure of "advertisement"
str(advertisement1)

# Now first build the linear model using lm() and store it into a object "model_1"
model_1 <- lm(Sales~.,data=advertisement1)

#Now, check the summary of your first model i.e model_1
summary(model_1)

# Compare simple model with Newspaper with the MLR model:
# Create a Simple Linear Regression model where Sales is the independent variable and Newspaper the only independent variable
news_model <- lm(Sales~Newspaper, advertisement1)

# Check the summary of both the models
summary(news_model)
summary(model_1)

# Look at the correlations between the independent variables.
corrs = cor(advertisement1[, -4])
View(round(corrs, 2))

# Remove the Newspaper variable, as it was insignificant in the multiple variable model
# Store the new linear model having TV and Radio marketing as the two significant variables into the object "model_2" .
model_2 <- lm(Sales~.-Newspaper,data=advertisement1)

# Great! Check the summary of model_2
summary(model_2)
View(advertisement1)

#If the budget only allows investment in one advertisement channel, which marketing channel would you pick for the best return on investment?
#Since the beta coefficient of Radio marketing is quite higher than that of TV marketing, it implies that increasing the Radio marketing budget by a unit will increase the sales more than an increase in TV marketing will. Thus, investing in Radio marketing will bring more returns.





