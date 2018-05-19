library(ggplot2)
install.packages("ggthemes")
library(ggthemes)

#define number of games and a set of 3 red and 2 blue balls 
games <- 75
balls <- c(1,1,1,0,0)

number_of_red_balls <- vector(mode="integer", length= games)

#choose 4 balls 'games' number of times

for(n in 1:games){
  s= sample(balls,4,replace = T)
  number_of_red_balls[n] <- sum(s)
}

number_of_red_balls
table(number_of_red_balls)

ggplot(data= number_of_red_balls)+xlab("Number of red balls")+ylab("count")+ggtitle("Distribution of X= Number of Red Balls")



##Mathematically speaking, for a random variable X that can take values 
#x1,x2,x3,...........,xn, the expected value (EV) is given by:

#EV(X)=x1???P(X=x1)+x2???P(X=x2)+x3???P(X=x3)+...........+xn???P(X=xn)

  
### practice
student_loan <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Inferential statistics\\Inferential Statistics - Student Loan.csv",stringsAsFactors = FALSE)
str(student_loan)
View(student_loan)
colnames(student_loan)[2] <- "EDA"
str(student_loan)
colnames(student_loan)[3] <- "Recovery"
str(student_loan) 
colnames(student_loan)[4] <- "PD"
str(student_loan) 
student_loan$Recovery
student_loan$lossrecovered <- student_loan$EDA*student_loan$Recovery
for(i in 1:nrow(student_loan)){
  
  df$lossrecovered [i] <- student_loan$EDA[i] * student_loan$Recovery[i]
  
}
