#Ordered and Unordered Categorical Variables
#Categorical variables can be of two types - ordered categorical and unordered categorical. In unordered, it is not possible to say that a certain category is 'more or less' or 'higher or lower' than others. For example, color is such a variable (red is not greater or more than green etc.)
#On the other hand, ordered categories have a notion of 'higher-lower', 'before-after', 'more-less' etc. For e.g. the age-group variable having three values - child, adult and old is ordered categorical because an old person is 'more aged' than an adult etc. In general, it is possible to define some kind of ordering.

#Metadata can be created manually as well as in R. It is recommended that you create a metadata description file for your reference and also for others to understand the data set better.
#You learnt the difference between ordered and unordered categorical variables -
#Ordered ones have some kind of ordering. Some examples are
#Salary = High-Medium-low
#Month = Jan-Feb-Mar etc.
#Unordered ones do not have the notion of high-low, more-less etc. Example:
  #Type of loan taken by a person = home, personal, auto etc.
#Organisation of a person = Sales, marketing, HR etc.

#quantitative variables. These are simply numeric variables which can be added up, multiplied, divided etc. For example, salary, number of bank accounts, runs scored by a batsman, the mileage of a car etc.

#Categorical variables
#Unordered 
#Ordered
#Quantitative / numeric variables

###Un-Ordered Categorical variables

#It is important to note that rank-frequency plots enable you to extract meaning even from seemingly trivial unordered categorical variables such as country, name of an artist, name of a github user etc.
#The objective here is not to put excessive focus on power laws or rank-frequency plots, but rather to understand that non-trivial analysis is possible even on unordered categorical variables, and that plots can help you out in that process.

##Why plotting on a log-log scale helps
#The objective of using a log scale is to make the plot readable by changing the scale. For example, the first ranked item had a frequency of 29000, the second ranked had 3500, the seventh had 700 and most others had very low frequencies such as 100, 80, 21 etc.  The range of frequencies is too large to fit on the plot.
#Plotting on a log scale compresses the values to a smaller scale which makes the plot easy to read.
#This happens because log(x) is a much smaller number than x. For example, log(10) = 1, log(100) = 2, log(1000) = 3 and so on. Thus, log(29000) is now approx. 4.5, log(3500) is approx. 3.5 and so on. What was earlier varying from 29000 to 1 is now compressed between 4.5 and 0, making the values easier to read on a plot.
#To summarise, the major takeaways from this lecture are:
#Plots are immensely helpful in identifying hidden patterns in the data 
#It is possible to extract meaningful insights from unordered categorical variables using rank-frequency plots
#Rank-frequency plots of unordered categorical variables, when plotted on a log-log scale, typically result in a power law distribution

##Ordered Categorical variables
#whenever you have a continuous or an ordered categorical variable, make sure you plot a histogram or a bar chart and observe any unexpected trends in it.


##Quantitative varibales:
#While mean gives an average of all the values, median gives a typical value that could be used to represent the entire group. As a simple rule of thumb, always question someone if he or she uses the mean, since median is almost always a better measure of 'representativeness'.

##summary
#Let's summarise what you learnt:
#Metadata description describes the data in a structured way. You should make it a habit of creating a metadata description for whatever data set you are working on. Not only will it serve as a reference point for you, it will also help other people understand the data better and save time.
#Distribution plots reveal interesting insights about the data. You can observe various visible patterns in the plots and try to understand how they came to be.
#Summary metrics are used to obtain a quantitative summary of the data. Not all metrics can be used everywhere. Thus, it is important to understand the data and then choose what metric to use to summarise the data.

##quantile
#What number of shares falls at the 78th percentile?
popularity <- read.csv("C:/Users/212488767/Desktop/Data Science training/IIITB/EDA/Univariate Analysis/popularity.csv")
quantile(popularity$shares, seq(0,1,0.26))
#78% articles were shared 3100 times or less.
#The mean number of shares lies between:
avg <- mean(popularity$shares)
avg
prob= quantile(popularity$shares, seq(0.1,0.9,0.1))
prob
#Use probs = seq(0.1, 0.9, 0.1) and you'll get the number of shares at the 10th, 20th,...90th percentiles. The mean 3395 lies between the 70th and 80th percentiles (2300 and 3400).
#Apply the quantile function again to get the percentile distribution shares at 1%, 2%, 3%,...100% in your R console. At which percentile do you see the most drastic change in the number of shares?
prob= quantile(popularity$shares, seq(0.01,1,0.01))
prob
#99 to 100
#Feedback : Use probs = seq(0.01, 1, 0.01) and you'll get the number of shares at the 1st, 2nd,...99th, 100th percentiles. You'll notice that the number of shares jumps close to 26 times or increases around 2563% from 99th to 100th Percentile

quantile(popularity$shares,0.95)
p<- popularity[popularity$shares < quantile(popularity$shares, 0.95), ]
mean(p$shares)
sd(p$shares)
