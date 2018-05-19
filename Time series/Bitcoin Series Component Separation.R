#Loading the required libraries
#Introduction to Time Series
#When you plot this time series, it looks like it should follow an exponential distribution. Hence, you should try fitting an exponential function to the series.
#One way to simplify it is to fit a model that predicts the log price on a monthly basis.
#Using lmfit, fit this curve to the bitcoin data.
#Now, create the variable global_pred, which contains all the predictions made using the global component of the model (the global component of the model that finds the log price). The value of global_pred for June 2017 is approximately equal to
#In June 2017, 30 months would have passed since December 2014. So, if you want to find the value of global_pred for June 2017, you should find the 30th element in the vector global_pred. Using the command global_pred[30], you will find that it is approximately equal to 7.5.
#Now subtract the global predictions from the original values of the log prices, and store them in a variable called local_pred.
#The value of local_pred for June 2017 is approximately equal to
#In June 2017, 30 months would have passed since December 2014. So, if you want to find the value of local_pred for June 2017, you should find the 30th element in the vector local_pred. Also, remember that you have to subtract the global predictions from the log of the original values, not the original values themselves. Creating the vector local_pred this way, and then using the command local_pred[30], you will find that it is approximately equal to 0.3.

library(graphics)
library(forecast)

#loading the file into R

bitcoin_price_data <- read.csv("bitcoin_price_historical_data.csv", header = T, sep = ',')

nrow(bitcoin_price_data)

#Converting dataframe to time series

timeser <- ts(bitcoin_price_data$Price)
plot(timeser)

#Building final model in R

bitcoin_price_data$log_Price <- log(bitcoin_price_data$Price)

globalfit<- lm(log_Price ~ Months, data = bitcoin_price_data)
global_pred<-predict(globalfit)

plot(timeser, col="black")
lines(global_pred, col="red")

log_timeser <- log(timeser)

local_pred <- log_timeser-global_pred
plot(local_pred, col="red")