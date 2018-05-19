setwd("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Linear Regression")
news_paper_marekting <- read.csv("newspapermarketing.csv")
str(news_paper_marekting)

plot(news_paper_marekting$Newspaper, news_paper_marekting$Sales)

set.seed(100)

training <-sample(1:nrow(news_paper_marekting), 0.7*nrow(news_paper_marekting))

traindataset <- news_paper_marekting[training,]
testdataset <-news_paper_marekting[-training,]

model_newspaper <-lm(Sales~Newspaper, data= traindataset)
summary(model_newspaper)

predict_news <- predict(model_newspaper, testdataset[1])
View(predict_news)

testdataset$testsales <-predict_news
r = cor(testdataset$Newspaper, testdataset$testsales)
rsquared <- r^2



