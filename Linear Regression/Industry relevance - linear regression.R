#Linear regression
#Forecasting and prediction
# reg gurantees interpolation of data not extrapolation
# reg shows correlation not causation
# linear regression is a parametric model, as opposed to non-parametric ones.
#a parametric model can be described using a finite number of parameters. For e.g., a linear regression model built using n independent variables will have exactly n 'parameters' (i.e. the n coefficients). The entire model can be described using these n parameters.
# non parametric reg - does not follow fixed parameters
#Interpolation basically means using the model to predict the value of a dependent variable on independent values that lie within the range of data you already have. Extrapolation, on the other hand, means predicting the dependent variable on the independent values that lie outside the range of the data the model was built on

#forecasting: focus : final projected result, forecasted value
#assumes everything remains same as of today, forecasting will change if new incident occurs
#chooses accuracy over explanation

#prediction: focus : identifying the driver variables and measuring their impact on dependent variables
#assumption: no specific asumption is considered
#simple models are better than comples models

#Regression equation
# Y = alpha + b1x1 + b2x2  +b3x3 +b4x4+ b5x5
#bi >0   if beta is positive xi increases as y increases
 #bi<0    if beta is negative xi increases as y decreases

# possible cases for decline in Y
#1) 1 or more coefficients whose coefficients are +ve have declined
#2) 1 or more predictors whose coefficients are -ve have increased

#Heteroskedascity:
#1) the errors (the differences between the actual views and the views predicted by the model) were randomly distributed. this  that there are no variables that could have helped explain the model better. 
#2)A non-random error pattern, on the other hand, would mean that the errors are capturing some patterns, thus indicating that the model could have been better. A non-random error pattern indicates that there are certain systematic unexplained aspects in the outcomes that are being captured in the error. This pattern in the errors could probably have been explained by some explanatory variable which is missing from the model. So, the idea is that a model should explain everything that is possible, such that only the random errors are left.


#
#It is important to understand if a linear regression modelling will be applicable to the problem you are trying to solve. E.g. linear regression can't help you decide if a customer will opt out of a subscription, as this is a classification problem.
#Linear regression guarantees interpolation but not extrapolation.
#While linear regression can be used for both projection and prediction, there is a difference between the two. In prediction, the goal is to identify the most important variables that explain the outcome in a simpler way. In projection, the goal is to accurately forecast the outcome, no matter how complex the model gets.
#The business goal is crucial and will decide what path the modelling process should take.
#In the industry, variables that are actionable are valued over others. E.g. given two quite similar variables, "Views to the platform" and "Visitors to the platform", the latter is more actionable, as it is easier to get viewers to the platform than forcing anybody to watch the shows.
#You don't end the modelling process until you are sure that no more significant variables could be added to explain the outcome. Thus, you check for randomness of errors, which could indicate if any KPI that could have helped explain the outcome was left out.

