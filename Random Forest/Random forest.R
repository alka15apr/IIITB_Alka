#Random forests use a technique known as bagging, which is an ensemble method. 
#In ensembles, a collection of models is used to make predictions, rather than individual models.
#the most popular in the family of ensemble models is the random forest: an ensemble made by the combination of a large number of decision trees.

#In principle, ensembles can be made by combining all types of models. 
#An ensemble can have a logistic regression, a neural network, and few decision trees working in unison.

#Idea behind ensemble########################

#1) collection of diverse and acceptable models (acceptably efficient)
#2) diversity  means: strengths and weakness of different models complement each other.
#3) acceptability: model performs better than random guessing
#4) acceptability criterion: P(correct prediction)>0.05

#Ensembles of models are somewhat analogous to teams of individual players. If you were to choose a football team, there would be two things you'd do without fail:
#Choose people with different skill sets, such as defenders, attackers, and a goalkeeper, to ensure diversity, and
#Choose good players, i.e. ensure that all players are acceptable from a skill set point of view (and at least better than a regular person).

#Diversity ensures that the models serve complementary purposes, which means that the individual models make predictions independent of each other. 
#The advantages of this are different depending on the type of ensemble.

#For example, a random forest is an ensemble with a large number of trees as individual models. Diversity ensures that even if some trees overfit, the other trees in the ensemble will neutralise the effect. 
#The independence among the trees results in a lower variance of the ensemble compared to a single tree. 

#Acceptability implies that each model is at least better than a random model. 
#This is a pretty lenient criterion for each model to be accepted into the ensemble, i.e. it has to be at least better than a random guesser.


##Diversity- statistical definition
#1) Ans of different models are not correlated
#2) agreement between answers of different models is coincidental

# understand how an ensemble makes decisions, consider an ensemble with 100 models comprising of decision trees, logistic regression models, etc.
#Given a new data point, each model will predict an output y for this data point.
#If this is binary classification, then you simply take the majority score. 
#If more than 50% models say y = 0, you go with 0 and vice-versa.



#Also, the ensembles avoid getting misled by the assumptions made by individual models. 
#For example, ensembles (particularly random forests) successfully reduce the problem of overfitting. 
#If a decision tree in an ensemble overfits, you let it. 
#Chances are extremely low that more than 50% of the models have overfitted. 
#Ensembles make sure that you do not put all your eggs in one basket.


# Diversity represents independence, i.e. models are not correlated (and do not get influenced by) other models. 
#This means that the answers (predictions) given by two models are independent of each other (you'll study how this is achieved in a short while).
#For a model to be acceptable, the probability of it being correct should be more than 0.5 i.e. better than a random guess.


#Bagging

#Bagging stands for bootstrapped aggregation
#It is a technique for choosing random samples of observations from a dataset. Each of these samples is then used to train each tree in the forest. 
#it is just a sampling technique and is not specific to random forests.

#bagging type of ensembles, random forests are by far the most successful.
#They are essentially ensembles of a number of decision trees.
#You create a large number of models (say, 100 decision trees), each one on a different bootstrap sample, from the training set. 
#To get the result, you aggregate the decisions taken by all the trees in the ensemble. 

# Random forest
#Creats an ensemble of decision trees
#Builds decision trees on different samples 
# Takes the majority score

#Bootstrapping
#Building models on random samples from input data
#Aggregration
#aggregate results from bootstrapped models using a majority score

#Decision tree recap
# 1 assumptions
#data is in tabular format
#each row represents a data point
#each column represents an attribute
#2 Building a decision tree
#node represents a test on some attribute
# leaves contain the prediction for the target column
#for every split at a node, training data homegeneity should increase
#we split on attributes which cause th maximum increase in homogeneity


#Random Feature Selection in Random Forests
#Consider the heart disease data set where a few attributes such as Thal, blood pressure, etc., are prominent predictors for the target variable. If you were to build multiple decision trees on this as a part of an ensemble, considering all the attributes for all the individual trees, which of these violations would occur and be significant?
#If a few variables are prominent, a large number of trees will have them as important nodes, and they will look similar. Similar trees violate the condition of diversity.


#Bootstrapping means creating bootstrap samples from a given data set.
#A bootstrap sample is created by sampling the given data set uniformly and with replacement. 
#A bootstrap sample typically contains about 30-70% data from the data set. 
#Aggregation implies combining the results of different models present in the ensemble.

#random forest selects a random sample of data points (bootstrap sample) to build each tree, and a random sample of features while splitting a node.
#Randomly selecting features ensures that each tree is diverse.

#Suppose you want to build a random forest of 10 decision trees. 
#First, you will create 10 bootstrap samples from the data and then, train each tree on a different bootstrap sample. 
#Finally, while predicting a test case, each tree will make a prediction, and the final prediction will be the majority score of all these predictions.

#difference bteween random forest and bagging

#Bagging includes the creation of different bootstrap samples for different models, and aggregating the results of the models. Random forests use this technique along with randomly selecting features at each node while splitting it.

#model selection and evaluation recap
#complex model = unstable model
# bias variance trade off
# a model which makes very errors, it would be very unstable and have high variance
# high bias, low variance
#stable model = more easily generalizable

#Random forest property
# increased number of trees makes random forest stable more genraizable the model is



#Advantages of random forest
# It is diverse, more diversity =better results, more trees model becomes more stable
#Diversity arises because you create each tree with a subset of the attributes/features/variables, i.e. you don't consider all the attributes while making each tree. The choice of the attributes considered for each tree is random. This ensures that the trees are independent of each other.
#Stability arises because the answers given by a large number of trees average out. A random forest has a lower model variance than an ordinary individual tree.
#Immunity to the curse of dimensionality: Since each tree does not consider all the features, the feature space (the number of features a model has to consider) reduces. This makes the algorithm immune to the curse of dimensionality. A large feature space causes computational and complexity issues.
#Parallelizability: You need a number of trees to make a forest. Since two trees are independently built on different data and attributes, they can be built separately. This implies that you can make full use of your multi-core CPU to build random forests. Suppose there are 4 cores and 100 trees to be built; each core can build 25 trees to make a forest.
#Testing /training data and the OOB or out-of-bag error: You always want to avoid violating the fundamental tenet of learning: "not testing a model on what it has been trained on". While building individual trees, you choose a random subset of the observations to train it. If you have 10,000 observations, each tree may only be made from 7000 (70%) randomly chosen observations. OOB is the mean prediction error on each training sample x???, using only the trees that do not have x??? in their bootstrap sample. If you think about it, this is very similar to a cross-validation error. In a CV error, you can measure the performance on the subset of data the model hasn't seen before.
#In fact, it has been proven that using an OOB estimate is as accurate as using a test data set of a size equal to the training set.
#Thus, the OOB error completely omits the need for set-aside test data (though you can still work with test data like you have been doing, at the cost of eating into the training data).




# If you have only one tree, you have to rely on the decision it makes. The decision a single tree makes (on unseen data) depend highly on the training data since trees are unstable. In a forest, even if a few trees are unstable, averaging out their decisions ensures that you are not making mistakes because of a few trees' unstable behaviour.

#In terms of accuracy, is a random forest always better than a decision tree?
#While it is well known that random forests are better, in terms of accuracy, than a single decision tree, it cannot be said that they are better than every possible decision tree.
#It is just more difficult to build a decision tree that is better than a random forest. In fact, there may be several trees that provide better predictions on unseen data.

#the OOB error is calculated as the number of observations predicted wrongly as a proportion of the total number of observations.

# to calculate the OOB error Only the training set is used while calculating the OOB error, which is why it gives a good idea of model performance on the unseen data without using a test set.
#All the observations of the training set are used to calculate the OOB error.


#Hyperparameters in random forest

#hyperparameters such as the number of trees, the number of variables considered at each split, etc. Also, remember that in random forests, the out-of-bag error is a neat metric to evaluate the ensemble, since it reflects how well the ensemble performs on data it has not seen.





