#Regression: The output variable to be predicted is a continuous variable, e.g. scores of a student
#Classification: The output variable to be predicted is a categorical variable, e.g. classifying incoming emails as spam or ham
#Clustering: No pre-defined notion of label allocated to groups/clusters formed, e.g. customer segmentation 

#The training data set should be abundant and diverse in nature for model building. Otherwise, your model won't be trained properly since your model has not seen the spam. Therefore, it hasn't learnt about the characteristics of spam, so it won't be able to tell spam apart from ham. So here, your algorithm will not be able to predict very accurately.

#Supervised learning methods
#Past data with labels is used for building the model
#Regression and classification algorithms fall under this category
#The past data is divided into training and testing data sets for building the model

#Unsupervised learning methods
#No pre-defined labels are assigned to past data
#Clustering algorithms fall under this category

##Linear regression
#equation of a straigth line
# y = mx+c
#A simple linear regression model attempts to explain the relationship between a dependent and an independent variable using a straight line.
#The independent variable is also known as the predictor variable. 
#The independent variable is also known as the predictor variable.
# And the dependent variables are also known as the output variables.

#The coefficients of the least squares regression line are determined by the Ordinary Least Squares method - which basically means minimising the sum of the squares of the y-coordinates of actual data - y-coordinates of predicted data
#The Ordinary Least Squares method has the criterion of the minimisation of the sum of squares of residuals. Residuals are defined as the difference between the y-coordinates of actual data and the y-coordinates of predicted data.
#the best-fitting regression line is the line The line that minimises the sum of squares of distances of points from the regression line
#The criterion is given by the Ordinary Least Squares (OLS) method, which states that the sum of squares of residuals should be minimum.
#the best-fit line is obtained by minimising a quantity called Residual Sum of Squares (RSS)

#Residual 
#error(i) <- y actual(i) - y (i)predicted
#ordinary least square method
#e1^2 + e2^2 +....en^2 = Residual sum of squares(RSS) #cost function

#best-fit line is obtained by minimising a quantity called Residual Sum of Squares (RSS)


# Ways to optimize cost funtion which is residual sum of sqaures
#: The RSS for any regression line is given by this expression: 
#???(yi???yipred)2. RSS is the sum of the squared difference between the actual and the predicted values, and its value will change if the units change since it has units of 
#y^2. For example, (140 rupees - 70 rupees)^2 = 4900, whereas (2 USD - 1 USD)^2 = 1. So value of RSS is different in both the cases because of different units.

#Disadvantage of RSS
#depends on the scale of y and hence do not give he correct picture


R^2 = 1-(RSS/TSS)
#Higher the R square, better is the model
#R^2 is a relative measure which normalozes with TSS



#Machine learning models can be classified into following two categories on the basis of learning algorithm:
#Supervised learning method: Past data with labels is available to build the model
#Regression: The output variable is continuous in nature
#Classification: The output variable is categorical in nature
#Unsupervised learning method: Past data with labels in not available
#Clustering: No pre-defined notion of labels is there
#Past data set is divided into two parts during supervised learning method: 
#Training data  is used for the model to learn during modelling
#Testing data is used by the trained model for prediction and model evaluation
#Linear regression models can be classified into two types depending upon the number of independent variables: 
#Simple linear regression: When the number of independent variables is 1
#Multiple linear regression: When the number of independent variables is more than 1
#The equation of the best fit regression line Y = ????? + ?????X can be found by minimising the cost function (RSS in this case, using the Ordinary Least Squares method) which is done using the following two methods:
# Differentiation
#Gradient descent method
#The strength of a linear regression model is mainly explained by R²,  where R² = 1 - (RSS / TSS)
#RSS: Residual Sum of Squares
#TSS: Total Sum of Squares

