
#Linear regression established the relationship bteween dependent and independent variables
#used for both prediction and forecasting
#regression guarantees interpolation of the data not the extrapolation
#regression shows relationship that is correlation not causation, correlation does not imply causation
#parametric regression
#A multiple regression model has the form: Y = B0 + B1 * Tv_marketing +B2 * Radio marketing + B3 * newspaper marketing + error e. As Tv_marketing increases by 1 unit  (holding the Radio and Newspaper marketing expenditures constant), Sales(Y) will:
#Increase by B1 units
#Feedback : Coefficient B1 represents the change in Sales(Y) with per unit change in Tv_marketing. Since B1 is positive, with a unit change in Tv marketing, the sales will increase.  
  
#If p-value is higher than the significance level, you should fail to reject the null hypothesis.

#Feedback : p>0.05 means that you fail to reject the null hypothesis, i.e. null hypothesis is true that the variable is insignificant. So you will remove variables with higher p-value.

#Build a primary model "model_1" taking into consideration all the independent variables

#Analyse the summary of "model_1".

#Remove the insignificant variable on the basis of the p-value. The p-value should be <0.05 for a variable to be significant.

#Build the final model with the remaining variables.

# set.seed() just makes sure that the random indices created will be the same when the code is run the next time, to get the same results.
#When dividing into training and testing data set, you are generating random numbers to be used as indices, which will fall into training and testing sets. What set.seed() does is - it makes sure that the random numbers (and thus training and testing indices) are the same when the code is run again in the future, so that the results are the same.  
#R-squared increases when a variable is added, no matter if it is significant or not.
#Adjusted R-squared would decrease if the increase in R-squared is very small and the added variable has little correlation with Y.

#Multicollinearity is present when independent variables are correlated with each other.
#Multicollinearity makes it difficult to assess the effect of individual predictors. 
#A variable with a high VIF means it can be largely explained by other independent variables.
#Thus, you have to check and remove variables with a high VIF after checking for p-values, implying that their impact on the outcome can largely be explained by other variables.

#A variable with a high VIF means it can be largely explained by other independent variables. 
#Thus, we have to check and remove variables with a high VIF after checking for p-values, implying that their impact on the outcome can largely be explained by other variables.

#Variables with a high VIF can be statistically significant (p<0.05).
# VIF describes the extent of multicollinearity. The variables may still be significant in explaining the outcome.
#the higher the VIF, the higher the multicollinearity
#Multicollinearity can be detected using various ways, VIF (variance inflation factor) being one of them.
#The occurrence of multicollinearity does not reduce the predictive power of the model as a whole, though it affects the reliability of the coefficients of individual predictors.
# VIF uses R-squared in its formula. R-squared here is calculated by regressing the concerned independent variable against the other independent variables.
#Multicollinearity makes it difficult to assess the individual impact of a predictor. The coefficients capture the impact of the other variables as well. Thus, the coefficients will be exaggerated or reduced. Thus, increase of x sq. ft. in area may not result in an increase of b(x) in the price. But since multicollinearity has little effect on model accuracy (adjusted R-squared), the price predictions may be correct.



#all the steps we used throughout the linear regression model building process:
#1 Once you understood the business objective, you prepared the data, followed by EDA and the division of data into training and test data sets.
#2 The next step was the selection of variables for the creation of the model. Variable selection is critical because you cannot just include all the variables in the model; otherwise, you run the risk of including insignificant variables too.
#3 This is where forward selection, backward selection, and stepwise selection come into the picture. But in linear regression, we focused on the backward selection method. You used stepAIC to quickly shortlist some variables which are significant to save time.
#4 However, these significant independent variables might be related to each other. This is where you need to check for multicollinearity amongst variables using variance inflation factor (VIF) and remove variables with high VIF and low significance (p>0.05).
#5 The variables with a high VIF or multicollinearity may be statistically significant (***) or p<0.05, in which case you will first have to check for other insignificant variables (p>0.05) before removing the variables with a higher VIF and lower p-values
#6 Continue removing the variables until all variables are significant (***) or p<0.05, and have low VIFs.
#7 Finally you arrive at a model where all variables are significant and there is no threat of multicollinearity. 
#8 The final step is to check the model accuracy on the testing data.

#1. Linear Regression - Data Preparation

#De-duplication of rows
#Missing value imputation 
#Outlier treatment
#Converting variables to appropriate types
#Creating dummy variables 


#R-squared is defined as the square of correlation between actual and predicted values
#of the variable. Use (cor(test$homes_under_1000, predicted value))^2 to find the
#r-squared value.


#Generally, a deviation of +(-) 5% in the R-squared value of the model for the test data
#is acceptable. However, if the deviation is significant (>5%) then we need to recheck
#the model. Having said that, it is always a subjective call to take.


