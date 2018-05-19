install.packages("graphics")
install.packages("forecast")
library(graphics)
library(forecast)
exchange_rate_data <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Time series\\exchange-rate-twi.csv", header = T, sep = ',')
nrow(exchange_rate_data)
View(exchange_rate_data)
timeser <- ts(exchange_rate_data$Exchange.Rate.TWI)
View(timeser)
#Creating a time series. The ts() function will convert a numeric vector into an R time series object.
plot(timeser)
par("mar")
par(mar=c(1,1,1,1))
plot(timeser)
Reg<-lm(Exchange.Rate.TWI~Month,data=exchange_rate_data)
summary(Reg)

bitcoin <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Time series\\bitcoin_price_historical_data.csv", header = T, sep = ',')
nrow(bitcoin)
View(bitcoin)

timeser <- ts(bitcoin$Price)
plot(timeser)

timevals <- c(1:nrow(bitcoin))
timeseriesdf <- as.data.frame(cbind(timevals, as.vector(timeser)))
colnames(timeseriesdf) <- c('Months', 'Price')

lmfit <- lm(Price ~ Months, data=timeseriesdf)
globalpred <- predict(lmfit, Month=timevals)
plot(timevals, globalpred, col='red', type = "l")
summary(globalpred)
str(globalpred)
globalpred[30]
localpred <- timeser - globalpred
localpred[30]
