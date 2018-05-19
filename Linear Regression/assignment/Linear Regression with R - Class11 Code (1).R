###Linear Regression Sample

##Loading Data
mmix<-read.csv("MMix.csv",header=TRUE,stringsAsFactors=FALSE)

##Checking Data Characteristics
dim(mmix)
str(mmix)
head(mmix)
tail(mmix)

##Attaching Dataset
attach(mmix)

summary(mmix$NewVolSales)
summary(NewVolSales)

##Creating Indicator Variables
unique(Website.Campaign)

mmix$FB<-ifelse(Website.Campaign=="Facebook",1,0)

##Creating New Variables
mmix$LnSales<-log(NewVolSales)
mmix$LnPrice<-log(Base.Price)
mmix$OfflineSpend<-Radio+TV+InStore

colSums(is.na(mmix))
summary(mmix)

summary(Base.Price)

mmix$Price_Bkt[Base.Price < 15.03]<-"Low"
mmix$Price_Bkt[Base.Price >= 15.03 & Base.Price < 15.33]<-"Avg"
mmix$Price_Bkt[Base.Price >= 15.33 & Base.Price < 15.64]<-"High"
mmix$Price_Bkt[Base.Price >= 15.64]<-"V.High"

##Checking relation between sales and price variable
hist(NewVolSales)
hist(Base.Price)
cor(NewVolSales,Base.Price)
plot(NewVolSales~Base.Price)
plot(NewVolSales~Radio)

##Building SimpLe Linear Regression Model
Reg<-lm(NewVolSales~Base.Price,data=mmix)
Reg
summary(Reg)

Reg<-lm(NewVolSales~as.factor(Price_Bkt),data=mmix)
Reg
summary(Reg)

mmix$PrizeBktLow<-ifelse(Price_Bkt=="Low",1,0)

Reg<-lm(NewVolSales~as.factor(PrizeBktLow),data=mmix)
Reg
summary(Reg)

#Getting the formula
formula(Reg)

##Multivariate Regression Model
plot(NewVolSales~TV)
plot(NewVolSales~Radio)
plot(NewVolSales~InStore)

Mulreg<-lm(NewVolSales~Base.Price+InStore+as.factor(Website.Campaign),data=mmix)
Mulreg
summary(Mulreg)

Mulreg<-lm(NewVolSales~Base.Price+InStore+Radio+TV+as.factor(Website.Campaign),data=mmix)
Mulreg
summary(Mulreg)

Mulreg<-lm(LnSales~LnPrice+InStore+as.factor(Website.Campaign),data=mmix)
Mulreg
summary(Mulreg)

Mulreg<-lm(NewVolSales~LnPrice+InStore+as.factor(Website.Campaign),data=mmix)
Mulreg
summary(Mulreg)

#Getting the formula
formula(Mulreg)

##Getting predicted values
PredSales<-predict(Mulreg)
PredSales

##Finding Residuals
ResSales<-resid(Mulreg)
ResSales

##Plotting Residuals vs Predicted Values
##Checking Heteroskedastcity
plot(PredSales,ResSales,abline(0,0))
plot(NewVolSales,ResSales,abline(0,0))

##Checking Multi-Collinearity
library(car)
vif(Mulreg)

##Plotting actual vs predicted values
plot(mmix$NewVolSales,col="blue",type="l")
lines(PredSales,col="red",type="l")