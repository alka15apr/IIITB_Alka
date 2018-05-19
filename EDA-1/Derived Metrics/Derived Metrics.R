#Steven's typology classifies variables into four types - nominal, ordinal, interval and ratio:
#Nominal variables: Categorical variables, where the categories differ only by their names; there is no order among categories, e.g. colour (red, blue, green), gender (male, female), department (HR, analytics, sales)
  #These are the most basic form of categorical variables
#Ordinal variables: Categories follow a certain order, but the mathematical difference between categories is not meaningful, e.g. education level (primary school, high school, college), height (high, medium, low), performance (bad, good, excellent), etc.
#Ordinal variables are nominal as well
#Interval variables: Categories follow a certain order, and the mathematical difference between categories is meaningful but division or multiplication is not, e.g. temperature in degrees celsius ( the difference between 40 and 30 degrees C is meaningful, but 30 degrees x 40 degrees is not), dates (the difference between two dates is the number of days between them, but 25th May / 5th June is meaningless), etc.
#Interval variables are both nominal and ordinal
#Ratio variables: Apart from the mathematical difference, the ratio (division/multiplication) is possible, e.g. sales in dollars ($100 is twice $50), marks of students (50 is half of 100), etc.
#Ratio variables are nominal, ordinal and interval type

#Which of the following is an ordinal variable (but not interval or ratio)?
#The grades of children e.g. A+. A, B+ B, C+, C
#Feedback : This is an ordinal but not interval variable (since B - A is meaningless) or ratio variable (B/A is meaningless). This is also a nominal one since all ordinal variables are nominal.

#Which of the following is an interval type variable (but not ratio)?
#The name of a module in an UpGrad program e.g. module 1, 2, 3, 4, 5
#Feedback : The difference between modules is meaningful (i.e. module 5 -module 2 tells you that there are 3 more modules to go), but not the ratio (there's no meaning in module 5/module 2).

#Which of the following data would come under the nominal category? Only one option is correct.
#Educational degree names such as M.Tech, M.Com, MBA, MSc
#Feedback : Nominal variables are categorical variables where the categories differ only by their names, and there is no order among the categories. E.g. education degrees such as M.tech, M.com, MBA are names of master degrees after the bachelor degree, which can be differentiated by degree names. Thus, educational degree is a nominal variable whereas "Ratings" such as "Very_Satisfied", "Satisfied" and "Not_satisfied" are distinguished by labels, but these can be ordered. But "Length" is a continuous variable. It can be expressed in ratio, for which you can perform the mathematical operation on it. On the other hand, "Date of birth" can be shown in intervals. It follows a particular order, for which the measurable difference between categories is meaningful.

#Interval variables can be ordered and their difference (or the distance between them) is meaningful. Which of the following are ordinal variables but NOT interval variables? More than one option may be correct.
#Heights of 4 people classified as high, medium and low
#Feedback : Height is an ordinal variable. It can be ordered by levels as high, medium and low.
#Amount of pain experienced by 3 patients - low, bearable, severe
#Feedback : It is an ordinal variable. It can be ordered by levels as low, bearable and severe.

#. Let's say you have a column having 'customer feedback' given on websites such as Amazon, Zomato etc. 
#One metric you can derive from this is the 'length of the feedback' measured in number of words. Length of feedback is a variable of type:
# : Length is a ratio type attribute - 30 words is twice that of 15 words.


## TO-DO
# A vector contains the scores of a player in various innings
# Write a function that takes in the vector as input and returns the number of centuries scored by the player.

centuries <- function(player_vector){
  
  sum_centuries <- sum(ifelse(player_vector>=100,1,0))
  
  return(sum_centuries)
}

centuries(c(120 ,30, 134, 16,102))


###Which player scored the highest number of centuries?
centuries <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\EDA\\Derived Metrics\\odi-batting.csv", stringsAsFactors = FALSE)
str(centuries)
summary(centuries)
centuries$centuries_scored<-ifelse(centuries$Runs>=100,1,0)
View(centuries)
total_cent = aggregate(centuries_scored~Player,data=centuries,sum)
View(total_cent)
total_cent[which(total_cent$centuries_scored==max(total_cent$centuries_scored)),]
max(total_cent$centuries_scored)
which.max(total_cent$centuries_scored)
total_cent[1518,]
#Feedback : Create a new column which contains 1 if the player scores more than 100 runs and 0 otherwise. Once you create the new column, sum up all the 1s grouped by the player name. In R, you could use the following commands: odi$new_variable<- ifelse(odi$Runs>=100,1,0) aggregate(new_variable~Country+Player,odi,sum)

#The 'strike rate' of a batsman is defined as the (number of runs scored / number of 100 balls faced). It is a measure of 'how fast a batsman has played'.For example, if a batsman scores 40 runs in 50 balls, the strike rate is 80 runs/100 balls.

#Among all the innings where a century was scored by a batsman, which one has the highest strike rate?

centuries$century_strike_rate=ifelse(centuries$centuries_scored==1,centuries$Runs*100/centuries$Balls,0)
centuries[centuries$century_strike_rate==max(centuries$century_strike_rate),]

#In which year were the maximum number of centuries scored by Indian players?
Indian_players <- centuries[centuries$Country=="India",]
View(Indian_players)
Indian_players$year <- Indian_players$MatchDate
Indian_players$year <-substring(Indian_players$year,7,10)
View(Indian_players)
Y1 <- aggregate(centuries_scored~ year,data=Indian_players,sum)
View(Y1)
Y1[Y1$centuries_scored==max(Y1$centuries_scored),]

#1998 Feedback : Create a new metric from the date column - "year". Then, subset your data with country = 'India' and aggregate the number of centuries by year. In Excel, you can use the YEAR() function to extract the year from the date and then use a pivot table to cross tabulate the year and number of centuries for Indian players. In R, you can use the format() function to extract the year from the date. Post that, the solution of this question would be: Indian_ply <- subset(odi,Country=="India") century_year <- aggregate(hundred~derived_year_column,Indian_ply,sum)

# TO-DO
# Write a function that takes input as a date string of the format "dd-mm-yyyy" and returns the day value
day <- function(day_vector){
  
  day_vector <- as.Date(day_vector,format = "%d-%m-%Y")
  
  day <- format(day_vector,"%d")
  
  return(day)
}
# Test - Passing "29-02-2016" in your function
day("29-02-2016")

# TO-DO
# Write a function that takes input as a date string of the format "dd-mm-yyyy" and returns the year value
year <- function(date_var){
  date_var <- as.Date(date_var,format = "%d-%m-%Y")
  year <- format(date_var,"%Y")
  return(year)
}

year("09-08-2004")

## Write a function that takes input as a date string of the format "dd-mm-yyyy" and returns the month value

month <- function(date_var){
  date_var <- as.Date(date_var,format = "%d-%m-%Y")
  month <- format(date_var,"%m")
  return(month)
}  

month("12-04-2014")
