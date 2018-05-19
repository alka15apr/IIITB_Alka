
library(MASS)
datasets::mtcars
mtcars <- mtcars
cor(mtcars$mpg, mtcars$wt)
#A higher absolute value of correlation (0.86) represents a strong relation between two variables. A negative value of correlation (-0.86) represents that one variable decreases with an increase in the other variable.
model <- lm(mpg~wt,data= mtcars)
summary(model)
#Feedback : R² = correlation² for dependent and independent variables in simple linear regression.
#The R² value for the testing data set should be close to the R² value for the training data set, for the model to be performing well.



