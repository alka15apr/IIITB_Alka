name <- c("Meena", "Teena", "Kiran", "Nitin", "Harpreet", "Shaikh")
age <- c(23, 34, 26, 28, 25,18)
majorsubject <- c("Maths","English", "Science", "English", "Science", "Maths")
pass <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE)

students <- data.frame(name, age, majorsubject, pass)
students

gender <- c("Female", "Female", "Male", "Male", "Female", "Male")
overallpercentage<- c(54, 67, 46, 59, 64, 48)
data <- data.frame(gender, overallpercentage)

students <- cbind(students, data)
students

name <- c("Kunal", "Hema", "Mohini", "Preet", "Myra", "Salma")
age<- c(26, 34, 28, 19, 25, 32)
majorsubject <- c("Science", "Maths","English", "Hindi", "Maths", "Maths")
pass <- c(FALSE,TRUE, FALSE,TRUE, TRUE, FALSE)
gender <- c("Male", "Female", "Female", "Male", "Female", "Female")
overallpercentage<- c(38, 67, 53, 62, 68, 53 )


students2 <- data.frame(name,age,majorsubject,pass,gender,overallpercentage)

finaldata <- rbind(students, students2)
finaldata
summary(finaldata)

finaldata[4,1] <- "Nitish"

finaldata$name <- as.character(name)
summary(finaldata)
finaldata$name <- as.character(finaldata$name)
finaldata$name
summary(finaldata)


finaldata[which(is.na(finaldata$name)), 1] <- "Nitish"
finaldata
#You should think about this in two steps - 1) you need to find the row index whe
students_fail <- finaldata[c(3,4,6,7,9,12), c(1,6)]
students_fail
students_fail<-finaldata[c(3:4,6:7,9,12), c(1,6)]
students_fail

marks <- c(82, 59, 45, 90, 71)
if (mean(marks) >= 60){
  print("No re-exam")}
else
  {
  print("re-exam")
  }


if (marks >=90) {
  grade <- "A"
  print(grade)
} else if (marks>=80){
  grade <- "B"
  print(grade)
} else if (marks>=70) {
  grade <- "C"
  print(grade)
} else if (marks>=60) {
  grade <- "D"
  print(grade)
} else if (marks>=50) {
  grade <- "E"
  print(grade)
} else {
  grade <-"F"
  print(grade)
}

for (i in (marks))
{  
  person <- marks[i, ]
  person
  
  if(person$marks >=90)
  {
      marks[i,"grade"] <- "A"
    }
     else if(person$marks>=80)
    {
      marks[i,"grade"] <- "B"
    }
    else
    {
      marks[i,"grade"] <- "C"
    }
}


f <- function() {
  x <- 8
  y <- x+2
  return(c(x, y))
}
y


