# https://archive.ics.uci.edu/ml/datasets/Energy+efficiency
library(caret)
house <- read.csv("ENB2012_data.csv")
inTrain <- createDataPartition(y=house$Y1,p=.7,list=F)
training <- house[inTrain,]
testing <- house[-inTrain,]
training_predictors <- training[,-c(9,10)]
training_outcome <- training[,c(9,10)]
testing_predictors <- testing[,-c(9,10)]
testing_outcome<- testing[,c(9,10)]
learnByRf_Y1 <- train(training_outcome[,1]~.,data=training_predictors,method="rf")
learnByRf_Y2 <- train(training_outcome[,2]~.,data=training_predictors,method="rf")
save(learnByRf_Y1,file="learnByRf_Y1.rda")
save(learnByRf_Y2,file="learnByRf_Y2.rda")
sum((predict(learnByRf_Y1,testing_predictors)-testing_outcome[,1])^2)
sum((predict(learnByRf_Y2,testing_predictors)-testing_outcome[,2])^2)
