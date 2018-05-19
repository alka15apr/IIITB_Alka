#univariate logistic regression
#binomial classification

simple_lr <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Logistic regression\\Simple_LR.csv")
summary(simple_lr)
model_1 <- glm(Diabetes~.,simple_lr, family = "binomial")
summary(model_1)


data("mtcars")
str(mtcars)

model_2 <- glm(am~cyl,mtcars, family = "binomial")
summary(model_2)
