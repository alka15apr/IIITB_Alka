
library(randomForest)
library(mlbench)
#Random Forest for regression
#Load the data
data("BostonHousing")

#Divide into train and test
train<-sort(sample(nrow(BostonHousing),0.7*nrow(BostonHousing)))
dev<-BostonHousing[train,]
test<-BostonHousing[-train,]

#Random Forest
set.seed(1)
rf.boston = randomForest(medv ~ ., data = dev,ntree=500,mtry=5,do.trace=100,importance=T)
rf.boston
#MSR and %var explained depends on 

oob.err = double(13)
test.err = double(13)
for (mtry in 1:13) {
  fit <- randomForest(medv ~ ., data = dev, mtry = mtry, 
                     ntree = 400)
  oob.err[mtry] = fit$mse[400]
  pred = predict(fit, test)
  test.err[mtry] = with(test, mean((medv - pred)^2))
  cat(mtry, " ")
}

# Draw a plot to understand the OOB error and test error MSE 
matplot(1:mtry, cbind(oob.err,test.err), pch = 19, col = c("red", "blue"), 
        type = "b", ylab = "Mean Squared Error")
legend("topright", legend = c("OOB", "Test"), pch = 19, col = c("red", "blue"))

test.err
oob.err
varImpPlot(rf.boston)
# The %IncMSE is based on the mean decrease in accuracy in predictions on the out of bag samples
# , when the given variable was excluded from the model. IncNodePurity is a measure of the total 
# decrease in node impurity that results from splits over that variable, averaged over all trees

#classification
#Read the dataset
titanic<-read.csv("C:/Evolve Data Sc. Training/train.csv",header=T)

#High level observation of teh data
summary(titanic)
remnames<- c("PassengerId","Name","Ticket","Cabin")
remove<-which(names(titanic) %in% remnames)
titanic<-titanic[,-remove]

#convert data type and handle missing values
length(which(is.na(titanic$Age)==T))
titanic$Age[is.na(titanic$Age)]<-mean(titanic$Age,na.rm=T)
Titanclass<-sapply(titanic,class)
titanic$Survived<-as.factor(titanic$Survived)
titanic$Pclass<-as.factor(titanic$Pclass)


#Generate train and test datasets
set.seed(1)
train<-sort(sample(nrow(titanic),0.7*nrow(titanic)))
dev<-titanic[train,]
test<-titanic[-train,]

#Random Forest
set.seed(1)
rf.titanic = randomForest(Survived ~ ., data = dev1,ntree=200,mtry=2,do.trace=100)
#Columns 1 and 2 are the class errors and OOB error is the weighted sum of teh class errors
rf.titanic
oob_fpr<-rf.titanic$confusion[5]
pred <- predict(rf.titanic, test,type="prob")
test$pred<-pred[,2]
#ROC Curve
# install.packages('ROCR')
library(ROCR)
score<-prediction(test$pred,test$Survived)
auc<-performance(score,"auc")
plot(performance(score,"tpr","fpr"),col="green")
abline(0,1,lty=8)

#finding cutoff
perf<-performance(score,"tpr","fpr")
cutoffs <- data.frame(cut=perf@alpha.values[[1]], fpr=perf@x.values[[1]], 
                      tpr=perf@y.values[[1]])

perf1<-performance(score,"acc")
cutoff_acc<-data.frame(cut=perf1@x.values[[1]], acc=perf1@y.values[[1]])
cutoff<-cutoff_acc[which(cutoff_acc$acc==max(cutoff_acc$acc)),1]

#taking cutoff at the decided cutoff value
cut1<-floor(test$pred+1-cutoff)

#confusion matrix
conf1<-table(test$Survived,cut1)
varImpPlot(rf.titanic)

#Oversample the minority class 
install.packages("DMwR")
library(DMwR)
dev1 <- SMOTE(Survived ~ ., dev, perc.over =60,perc.under = 270)

