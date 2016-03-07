# Online-News-Popularity

Comparing the performance of generalized linear model (glm), glm with penalized, boosted logistic regression,
extreme gradient boosting, random forest, and SVM with Radial Basis Function Kernel in predicting online
news popularity from the number of its shares in social media by using cross validation method. This project used Online News Popularity data set (2015) from UCI Machine Learning Repository.

Data source:
http://archive.ics.uci.edu/ml/datasets/Online+News+Popularity)

Objective:
To build model that best predict online news popularity from the number of its shares in social
media.

Data set:
Data set consists of 61 attributes (58 predictive attributes, 2 non-predictive, 1 response variable). The articles
of the news were published by Mashable (www.mashable.com). Attributes’ format are in continuous and
binary. Number of observations is 39644. Dataset does not have any missing value. Information related to
the attributes is in the link above.

Response variable is shares. shares is the number of shares of an online news in social media. shares is a
continuous variable, and we want to transform its format into binary using decision threshold of 1400 shares.
