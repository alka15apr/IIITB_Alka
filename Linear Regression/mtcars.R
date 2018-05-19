
library(MASS)
datasets::mtcars
mtcars <- mtcars
cor(mtcars$mpg, mtcars$wt)
#A higher absolute value of correlation (0.86) represents a strong relation between two variables. A negative value of correlation (-0.86) represents that one variable decreases with an increase in the other variable.
model <- lm(mpg~wt,data= mtcars)
summary(model)
#Feedback : R² = correlation² for dependent and independent variables in simple linear regression.
#The R² value for the testing data set should be close to the R² value for the training data set, for the model to be performing well.


# 1. MLR: mpg ~ all other variables
m1 = lm(mpg~., data = mtcars)
summary(m1)

# 2. Add a totally randomly generated independent variable
mtcars$random_var = sample(1:100, nrow(mtcars), replace = T)

# 3. Build a model and compare the R squared and adjusted R squared
m2 = lm(mpg~., data = mtcars)
summary(m2)



