# setwd("E:/Lectures3/488-PA/Paper Project/OnlineNewsPopularity")
setwd("~/mashable")
popul <- read.csv("OnlineNewsPopularity.csv")

#number of data with shares < 1400
shares_less1400 <- sum(as.numeric(popul$shares < 1400))

#number of data with shares >=1400
shares_more1400 <- sum(as.numeric(popul$shares >=1400))

#create new variable for shares as binary (>1400=1, <1400=0)
bi_shares <- as.numeric(popul$shares >= 1400)

#add variable bi_shares to dataset
pop <- cbind(popul,bi_shares)

#delete non predictive and shares variables
#new dataset popNew created
popNew <- pop[c(-1,-2,-61)]

#divide train / test
set.seed(123)
n <- nrow(popNew)
id <- sample(1:n, n, replace=FALSE)
popTrain <- popNew[id[1:5000],]
popTest <- popNew[id[5001:n],]

library(caret)
set.seed(678)
fitControl <- trainControl(## 5-fold CV
  method = "repeatedcv",
  number = 5,
  ## repeated ten times
  repeats = 5)

library(doMC)
registerDoMC(cores = 8)

grid <- expand.grid(C = c(1),
                    sigma = c(0.01))

#preProcValues <- preProcess(popTrain, method = "range")

#trainTransformed <- predict(preProcValues, popTrain)
#testTransformed <- predict(preProcValues, popTest)

#random forest
model.fit.rf <- train(factor(bi_shares)~., data = popNew,
                   method = "rf", #random forest method
                   trControl = fitControl)
print(model.fit.rf)

#glm
model.fit.glm <- train(factor(bi_shares)~., data = popNew,
                   method = "glm", #Generalized linear model
                   trControl = fitControl)
print(model.fit.glm)

#glmnet
model.fit.glmnet <- train(factor(bi_shares)~., data = popNew,
                       method = "glmnet", #Generalized linear model with penalized
                       trControl = fitControl)
print(model.fit.glmnet)

#logit boost
model.fit.logboost <- train(factor(bi_shares)~., data = popNew,
                       method = "LogitBoost", #Boosted logistic regression
                       trControl = fitControl)
print(model.fit.logboost)

#Xtreme gradient boosting
model.fit.xgb <- train(factor(bi_shares)~., data = popNew,
                            method = "xgbTree", #Extreme gradient boosting
                            trControl = fitControl)
print(model.fit.xgb)

#Svm
model.fit.svmrad <- train(factor(bi_shares)~., data = popNew,
                       method = "svmRadial", #Support vector machines with radial basis function kernel
                       trControl = fitControl)
print(model.fit.svmrad)


