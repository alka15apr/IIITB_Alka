
#Advantage of decision tree

#Predictions made by a decision tree are easily interpretable.

#A decision tree does not assume anything specific about the nature of the attributes in a data set. It can seamlessly handle all kinds of data - numeric, categorical, strings, Boolean, and so on.

#It does not require normalisation since it has to only compare the values within an attribute.

#Decision trees often give us an idea of the relative importance of the explanatory attributes that are used for prediction.

#disadvantages of decision tree:

#Decision trees tend to overfit the data. 
#If allowed to grow with no check on its complexity, a tree will keep splitting till it has correctly classified (or rather, mugged up) all the data points in the training set.

#Decision trees tend to be very unstable, which is an implication of overfitting. A few changes in the data can change a tree considerably.

# when The model has memorised the data, giving you a 98% training accuracy and leading to a high variance. Since it can now represent the training set very well, it has a low bias.

#####################################################3

#There are two broad strategies to control overfitting in decision trees: truncation and pruning.
#There are two ways to control overfitting in trees:
#Truncation - Stop the tree while it is still growing so that it may not end up with leaves containing very few data points.
#truncation is also known as pre-pruning.

#Pruning - Let the tree grow to any complexity.
#Then, cut the branches of the tree in a bottom-up fashion, starting from the leaves. It is more common to use pruning strategies to avoid overfitting in practical implementations.



#Truncation:if homogeneity of dataset > threshold level we will stop splitting the tree further


#various ways to truncate or prune trees, the rpart() function in R provides the following hyperparameters which you can control:

#Minsplit - This is the minimum size of partition for splitting. 
#If you set the minsplit = 30, any node with less than 30 observations will not be split further.

#Cp (complexity parameter) - This is the minimum percentage reduction in the error after a split, i.e. the error (which is '1 - accuracy') should reduce by at least the cp; otherwise, the split will not be attempted. 
#For example, if you set the cp = 0.01 (the cp is a fraction), a node will be split only if the error after the split reduces by at least 1%. Thus, the splits that only marginally improve the model (say, reduce the error only by 0.01%) will not be attempted.

#Maxdepth - This is the maximum depth to which a tree can grow.

#Minbucket - This is the minimum number of observations a terminal node (i.e. leaf) should have.
 

#help(rpart.control) - documentation of hyperparameters in rpart()

# Truncation lets you split the data only when the number of data points in the node is greater than or equal to the 'minsplit'.


##############################################

#Pruning

#In pruning, you chop off the tree branches;
#this results in a decrease in tree complexity.
#It also helps in reducing overfitting.

# data set is divided into three parts: 
#the training set, the validation set and the test data. 
#The validation set is used to tune hyperparameters, i.e. after deciding on a set of hyperparameters for a tree, you check the accuracy of the tree on the validation set.
#Pruning decision tree is one kind of regularization

#check the performance of a pruned tree on a validation set.
#If the accuracy of the pruned tree is higher than the accuracy of the original tree (on the validation set), then you keep that branch chopped. 
#Remember that the validation set is the third part of the data set, the first and second being the training and test set.

#use a function called prune().
#prune(decision_tree_model, cp)
#While pruning, you select a cp that minimises the error on the unseen data. 
#This value of the cp is obtained by using the printcp() function. 
#The xerror column of this function represents the error on the unseen data. Select the cp corresponding to the minimum error and put that value of the cp in the prune() function.


#complexity parameter (cp) as the minimum improvement in homogeneity measure that is required on every split. 
#The specific homogeneity measure that you will use here is the classification error. 
#The homogeneity and the classification error are analogous terms because homogeneity is defined using the number of points that are misclassified in a node.
#So, from now onwards please consider cp as the decrease in classification error on every split.


#A low value of the minsplit will lead to a small number of data points in the nodes. 
#This means that it is very likely that each leaf (obtained after splitting) is going to represent very few (or only one, in some cases) data points. 
#So, you increase the minsplit.

# : Increasing these hyperparameters will result in the early stopping of the tree.
#Hence, not all the data points would be correctly labelled, as opposed to a case when these hyperparameters were small (1 and 0 respectively).
#This will decrease the training accuracy.

#sUMMARY:
#Decision trees are prone to overfitting.
#There are two ways to avoid overfitting: truncation and pruning.
#In truncation, you let the tree grow only to a certain size, while in pruning, you let the tree grow to its logical end and then chop off the branches that do not increase accuracy on the validation set.
#There are various hyperparameters in the rpart() library that let you truncate the tree, namely minsplit, minbucket, max_depth, etc.

#Excercise , training set
#In total, there are 30 data points. Each partition has 15 data points. 
#The Gini index of partitions = (fraction of data points with a1 < 7)*(Gini index of partition with a1 < 7) + (fraction of data points with a1 >= 7)*(Gini index of partition with a1 >= 7).
# The Gini index of the partition with a1 < 7 =  
#(8/15)2+(7/15)2. The Gini index of the partition with a1 > =7 is 

#(7/15)2+(81/5)2. The Gini index of all the partitions = 
#(15/30)*(Gini index of partition with a1 < 7) + 
  
#(15/30)*(Gini index of partition with a1 >= 7).

#Which attribute will you split the training data on?
#The Gini index(a2 < 20) = 0.65, and the Gini index(a1 < 7) = 0.50. Since Gini index(a2 < 20) > Gini index(a1 < 7), you split on attribute 2.


#Let's say that you further split the left partition on a1 = 2, 12. You get the following tree on splitting
#What is the Gini index of the partitions obtained after splitting on a1 = 2,12? (Note: Choose the closest value.)

#Feedback : The Gini index of the partition with a1=2, 12 is 
#(16)2+(56)2. The Gini index of the partition with a1!=2, 12 is 

#(12/12)2+(0/12)2. The Gini index of all the partitions = 

#(6/18)*(Gini index of partition with a1=2,12) + 

#(12/18)*(Gini index of partition with a1!=2,12).
