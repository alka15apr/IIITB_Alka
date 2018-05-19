
#Recalling Session 1 

#Download the bank dataset file
setwd("C:/Users/212488767/Desktop/Data Science training/IIITB/Intermediate R")
getwd()

#Set right Working Directory.


#Reading excel file, with StringsasFactors command as False.
bank <- read.csv("bank.csv", stringsAsFactors = F)

#Check structure and datatype of bank
str(bank)

#Converting an atrribute into Factor
bank$marital <- factor(bank$marital)
str(bank$marital)

#Subsetting specific columns from bank data frame
subset1 <- data.frame(bank$age, bank$salary, bank$y)
str(subset1)

#Accessing a row of bank data frame
bank[1, ]

###




##Relational Operators on vectors 

8 > c(2, 9, 6, 8, 10)

c(8, 5, 7, 1, 0) > c(2, 9, 6, 8, 0)

c(8, 5, 7, 1, 0) > c(2, 9, 6, 8)




#Logical Operators

#AND Operator &&

6 > 5 & 7 > 4
6 > 5 & 1 > 4

#OR Operator |
6 > 5 | 7 > 4
6 > 5 | 1 > 4

#NOT Operator !

!TRUE

7 != 6
7 != 7

c(8, 5, 7, 1, 0) != c(2, 9, 6, 8, 0)

#Quiz practise
A_upvotes <- c(7, 3, 2, 8, 0, 4)
B_upvotes <- c(2, 1, 3, 4, 2, 4)
B_greater_A <- B_upvotes > A_upvotes
B_greater_A
length(A_upvotes >= 4)
sum(A_upvotes >= 4)
mean(A_upvotes >= 4)
(A_upvotes > 3) & (B_upvotes > 3)
(A_upvotes > 3) | (B_upvotes > 3)

##########

#If-Else Statements
#In R, the body of the statements (and loops) is written inside curly braces

shopping_bill <- c(90,130,52,75,70,24,72,90,125,68,56,50, 85)
total <- sum(shopping_bill)
total


if (total > 1000)
{
  print("You are out of cash!")
} else if (total <900){
  print("Yay! You can buy some chocolates!")
} else {
  print("Your shopping is done, but No Chocolate!")
}
######




#Applying logical & conditional statements on data-set

person <- bank[1, ]
person

if(person$marital == "married")
{
  if(person$housing == "yes" | person$salary > 60000)
  {
    print("Issue credit card")
  }
  else
  {
    print("Sorry, not eligible for credit card")
  }
} else if(person$marital == "single")
{
  if(person$education == "tertiary" & person$salary > 40000)
  {
    print("Issue credit card")
  }
  else
  {
      print("Sorry, not eligible for credit card")
  }
}

#####


#Loops

print("Hello")
print("Hello")
print("Hello")
print("Hello")
print("Hello")

for(i in 1:5)
{
  print ("Hello")
}

# Applying for loop for the bank case study

person1 <- bank[1,]
person2 <- bank[2,]
# and so on

# Run the credit card check for each person object individually

for (i in 1:nrow(bank))
{  
       person <- bank[i, ]
       person
       
       if(person$marital == "married")
       {
         if(person$housing == "yes" | (!is.na(person$salary) & person$salary) > 60000)
         {
           bank[i,"my_decision"] <- "yes"
         }
         else
         {
           bank[i,"my_decision"] <- "no"
         }
       } else if(person$marital == "single")
       {
         if(person$education == "tertiary" & !is.na(person$salary) & person$salary > 40000)
         {
           bank[i,"my_decision"] <- "yes"
         }
         else
         {
           bank[i,"my_decision"] <- "no"
         }
       }
}

#######

# Converting selecting columns to factor types simulateneosly

factor_columns <- c(2, 4, 5, 6, 7, 8, 10, 11, 12, 19, 20)

for (i in factor_columns) {
bank[, i] <- factor(bank[, i])}

str(bank)



#Functions

#Calling built-in functions

mean(bank$age)
sd(bank$age)

mean(bank$salary)
sd(bank$salary)

#Counting number of NA in bank dataframe
sum(is.na(bank))

#Counting number of NA in a bank column, say salary
sum(is.na(bank$salary))

#Row numbers which have bank$salary = NA
which(is.na(bank$salary))

#Calculating the mean and standard deviation of salary
mean(bank$age, na.rm = TRUE)
sd(bank$age, na.rm = TRUE)

#Search for mean function and look for attributes
?mean

#Calculating maximum age of the person in the data set
max(bank$age)

#Calculating the row number of person with maximum age
which.max(bank$age)
      
#Information about attributes for person with maximum age
bank[which.max(bank$age), ]

#Information about number of people - issued credit card
length(which(bank$y == "yes"))
sum(bank$y=="yes")
length(which(bank$my_decision == "yes"))

#Information about number of married & single people length(which(bank$y == "yes" & bank$marital == "married"))
length(which(bank$y == "yes" & bank$marital == "single"))


##############

# Writing functions in R

credit_card_decision <- function(p)
{
  if(p$marital == "married")
  {
    if(p$housing == "yes" | (!is.na(p$salary) & p$salary) > 60000)
    {
      decision <- "yes"
    }
    else
    {
      decision <- "no"
    }
  } else if(p$marital == "single")
  {
    if(p$education == "tertiary" & !is.na(p$salary) & p$salary > 40000)
    {
      decision <- "yes"
    }
    else
    {
      decision <- "no"
    }
  } else
    {
    decision = "no"
  }
  return(decision)
}

for(i in 1:nrow(bank))
{
  person <- bank[i,] 
  bank[i,"my_decision"] <- credit_card_decision(person)
}


######

# APPLY FAMILY

# Used to apply a function over several values simulatenaouly 
# Saves us from writing a complicated FOR loop


#Converting into Factors using R loop
bank <- read.csv("bank.csv", stringsAsFactors = F)
str(bank)

for (i in 1:ncol(bank)) {
  bank[, i] <- factor(bank[, i])}
str(bank)

#Converting into Factors using sapply
bank <- read.csv("bank.csv", stringsAsFactors = F)
str(bank)

bank2 <- data.frame(sapply(bank, factor))
str(bank2)


#Applying sapply to a vector
marks <- c(23,12,15,30,40)

sapply(marks,function(x) x/40*100)

####


#Practise:
A_upvotes <- c(7, 3, 2, 8, 0, 4)

if(mean(A_upvotes) >= 4)
{
  print("Congratulations, you won the Popular Badge")
} else if(mean(A_upvotes) >= 3)
{
  print("You are quite close to winning a Badge. Keep working hard.")
}
## 2nd example 
A_upvotes <- c(7, 3, 2, 8, 0, 4)
if(mean(A_upvotes) >= 8)
{
  print("Congratulations, you won the Superstar Badge")
} else if(mean(A_upvotes) >= 4)
{
  print("Congratulations, you won the Popular Badge")
} else 
{
  print("You are quite close to winning a Badge. Keep working hard.")
}
##3rd eg.
A_upvotes <- c(7, 3, 2, 8, 0, 4)
B_upvotes <- c(2, 1, 3, 4, 2, 4)
which(length(A_upvotes >= 4))
which(A_upvotes >= 4)
length(which(A_upvotes >= 4))
length(A_upvotes >= 4)
sum(which(A_upvotes >= 4))
mean(which(A_upvotes >= 4))
sum(A_upvotes >= 4)

##4th eg. functions:

function_math <- function(x, y){
  z <- x + y
  p <- x * y
  q <- z / p
  return(c(z, p, q))
}
function_math(2, 3)

##I wrote a function (named fun_square) which returns a vector (x^2, y^2, z^2 ) and takes (x, y, z) as the argument.
fun_square<- function(vector_in){
  vector_out <- vector_in^2
  return(vector_out)
}
fun_square(c(2, 3, 4))

#Functions take arguments as pieces of information or data which are needed to perform a task.
#They can take in as many arguments as you want.
#Arguments can be numeric, character or logical, vectors, and even large data sets.
#The body of the function contains the main set of instructions.
#Functions may return anything - numbers, characters, vectors, data sets, models, etc.

##eg

A_upvotes <- c(7, 3, 2, 8, 0, 4)
B_upvotes <- c(2, 1, 3, 4, 2, 4)
C_upvotes <- c(3, 2, 3, 4, 6, 2)
D_upvotes <- c(4, 2, 5, 3, 3, 1)

combined_vector <- c(A_upvotes, B_upvotes, C_upvotes, D_upvotes)
combined_df <- data.frame(A_upvotes, B_upvotes, C_upvotes, D_upvotes)


sapply(combined_df, mean)


##eg

v <- sapply(combined_df, max)
v[1]

## function mean

fun_mean<- function(vector_in){
  vector_out <- mean(vector_in)
  return(vector_out)
}
fun_mean(c(2, 3, 4))
