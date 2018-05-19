# Simple Linear regression 

#Importing dataset in R
setwd("C:/Users/212488767/Desktop/Data Science training/IIITB/Linear Regression")
advertising <- read.csv("tvmarketing.csv")

# Now let's check the structure of advertising dataset. 
# structure of dataset

str(advertising)



# Let's quickly look at the plot of sales and TV spend
plot(advertising$TV, advertising$Sales)





### So set the seed to 100, let's run it 
set.seed(100)
#set.seed() -function usd to reproduce the same reults each time while sampling 70% data for training dataset.
# The set.seed( ) command is used to reproduce the same results each time while sampling 70% data for the training dataset. This is done so that you get the same training data as your sample each time you execute the R code.


#### You can use sample function for getting the indices of your 70% of observations. 
#### Let's execute this commad. 

trainindices= sample(1:nrow(advertising), 0.7*nrow(advertising))

### Now create an object "train.advertising" and store the 70% of the data of housing dataset 
# by just passing the indices inside the housing dataset

train.advertising = advertising[trainindices,]


### Similarly store the rest of the observations into an object "test".
### Let's execute both train and test commands

test = advertising[-trainindices,]



#model<- lm(dependent varibale ~ independent variable, data = training data frame)

model1<-lm(Sales~TV,data = train.advertising)

# The model is stored as an object in the variable 'model' 
# Now, we want to check the summary to analyse the results of the model using summary (model).

summary(model1)
#62% of the variance has been explained

# A lot of information is popped by just checking the summary, 




# Now, execute this command
Predict_1 <- predict(model1, test[1])
Predict_1
#Feedback : The first argument of the predict( ) function is the model data frame and the second argument is the vector containing the values of the independent variable for which prediction is to be done. Here, you have to predict for the testing data, so test[-2] is used to access the marketing spend values for the testing data.
#Feedback : The predict( ) function takes the model and vector containing the values of the independent variable as the argument and returns the vector containing the predicted values of the dependent variable. Here, the dependent variable is sales, so it will return the predicted sales values for the testing data.

##Next, append the predicted results with the test data set 
# to compare the actual prices with the predicted ones

test$test_sales <- Predict_1
View(test)

r <- cor(test$Sales,test$test_sales)
rsquared <- r^2
rsquared
cor(test$TV, test$test_sales)

