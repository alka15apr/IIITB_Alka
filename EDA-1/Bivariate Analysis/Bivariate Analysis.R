#correlation is a number between -1 and 1 which quantifies the extent to which two variables 'correlate' with each other.
#If one increases as the other increases, the correlation is positive
#If one decreases as the other increases, the correlation is negative
#If one stays constant as the other varies, the correlation is zero


price <-read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\EDA\\Bivariate Analysis\\EDA_Gold_Silver_prices.csv",stringsAsFactors = FALSE)
str(price)
View(price)
install.packages("lubridate")
library(lubridate)
cor(price$GoldPrice,price$SilverPrice)

price$Month <- as.Date(price$Month,format="%mm-%YYYY")
str(price)
View(price)

#Plot a correlation matrix for the currencies.

currency <-read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\EDA\\Bivariate Analysis\\currencies.csv",stringsAsFactors = FALSE)
str(currency)
C1 <- currency[,-1]
colSums(is.na(C1))
c2 <- C1[nrow(C1),na.rm=TRUE]


cor(currency$Indian.Rupee, currency$Australian.Dollar)


###You want to understand the distribution of two variables - mother's education and the number of siblings. Complete the following statement:

ed <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\EDA\\Bivariate Analysis\\nas.csv")
table(ed$Mother.edu,ed$Siblings)
edage <- ed[ed$Father.edu, ed$Age]
edage
table(edage, ed$Science..)
