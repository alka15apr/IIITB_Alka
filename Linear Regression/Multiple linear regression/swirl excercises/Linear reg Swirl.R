install.packages("MASS")
library(MASS)
install.packages("car")
library(car)
library(swirl)
install_course()   
swirl()
setwd("C:\Users\212488767\Desktop\Data Science training\IIITB\Linear Regression\Multiple linear regression\swirl excercises")
train <- read.csv("train.csv", stringsAsFactors = FALSE)
test <- read.csv("test.csv", stringsAsFactors = FALSE )
View(train)
str(train)
model_1 <- lm(homes_under_1000~., data = train)
summary(model_1)
step<-stepAIC(model_1, direction="both")
step
model_2 <- lm(formula = homes_under_1000 ~ crime_rate + nitric_oxides + 
                avg_room + weighted_distances + pupil_teacher + corporate_proportion + 
                lower_status + radial_highwaysfarthest, data = train)
summary(model_2)
vif(model_2)
summary(model_2)

model_3 <- lm(formula = homes_under_1000 ~ nitric_oxides + 
                avg_room + weighted_distances + pupil_teacher + corporate_proportion + 
                lower_status + radial_highwaysfarthest, data = train)

vif(model_3)
summary(model_3)
cor(train$weighted_distances, train$nitric_oxides)

model_4 <- lm(formula = homes_under_1000 ~ avg_room + weighted_distances + pupil_teacher + corporate_proportion + 
                lower_status + radial_highwaysfarthest, data = train)
summary(model_4)
vif(model_4)

model_5 <- lm(formula = homes_under_1000 ~ avg_room + weighted_distances + pupil_teacher + corporate_proportion
                + radial_highwaysfarthest, data = train)

summary(model_5)
vif(model_4)
summary(model_4)

model_5 <- lm(formula = homes_under_1000 ~ avg_room + weighted_distances + pupil_teacher + corporate_proportion
            +lower_status , data = train)
summary(model_5)

model_6 <- lm(formula = homes_under_1000 ~ avg_room + weighted_distances + pupil_teacher
              +lower_status , data = train)
summary(model_6)
Predict<-predict(model_6, test[, -10])

(cor(test$homes_under_1000,Predict))^2

mean(abs(Predict-test$homes_under_1000))




