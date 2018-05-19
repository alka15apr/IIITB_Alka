##if a test(node) splits the data into  two partitions, this is called a binary decision tree.
#if a test(node) splits the data into more than two partitions, this is called a multiway decision tree.
#The decision trees are easy to interpret. Almost always, you can identify the various factors that lead to the decision.
# In SVMs, if a person is diagnosed with heart disease, you cannot figure out the reason behind the prediction. 



install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
heart <- read.csv("C:\\Users\\212488767\\Desktop\\Data Science training\\IIITB\\Tree Models\\Decision Tree\\heart.csv")
str(heart)

heart$heart.disease = factor(heart$heart.disease)
str(heart)
tree = rpart(heart.disease~., data=heart)
prp(tree)




#Linear regression will fit only one model to the entire data set; whereas you may want to divide the data set into multiple subsets and apply linear regression to each set separately.  decision trees help in such a case.

#In regression problems, a decision tree splits the data into multiple subsets. 
#The difference between decision tree classification and decision tree regression is that in regression, each leaf represents a linear regression model, as opposed to a class label.
# if you get a data set where you want to perform linear regression on multiple subsets, decision tree regression is a good idea.


#Decision trees are easy to interpret; you can always go back and identify the various factors leading to a decision.
#A decision tree requires you to perform tests on attributes in order to split the data into multiple partitions.
#In classification, each data point in a leaf has a class label associated with it.
#There are some cases where a linear regression model cannot be used to make predictions, such as when you want to divide the data set into multiple subsets because each subset has an independent trend corresponding to it. There, you use a decision tree model to make predictions because a tree regression model has the capability of splitting the data into multiple sets and assigning a linear regression model to each set independently.


#So you go step-by-step, picking an attribute and splitting the data such that the homogeneity increases after every split. 
#You stop splitting when the resulting leaves are sufficiently homogenous.

#All the data points belong to one label is a completely homogeneous set.

##specific methods that are used to measure homogeneity:
##namely the Gini index, entropy and information gain (for classification), and R-squared (for regression)

#Out of all the attributes, the attribute that results in the maximum increase in homogeneity is chosen for splitting.

#In decision tree, We want to split the data set such that the homogeneity of the resultant partitions is maximum.
#There are various ways to quantify homogeneity, such as the Gini index, information gain, entropy, etc. 

#Gini Index = sum of sqaures of the probabilities for the various labels as the measure of homogenity
# sigma(1 to k) (Pi)^2



#The total Gini index if you split on gender will be

#Gini Index(gender) = (fraction of total observations in male-node)*Gini index of male-node + (fraction of total observations in female-node)*Gini index of female-node.


#Similarly, you can also calculate the Gini index of the split on age and compare that with the Gini index of the split on gender that you calculated. 

###You then choose the attribute that has the higher Gini index.


#When all the points in the data set belong to one class label leading to the maximum homogeneity, the Gini index will be maximum.

#Entropy quantifies the degree of disorder in the data, and like the Gini index, its value also varies from 0 to 1.
#If a data set is completely homogenous, then the entropy of such a data set is 0, i.e. there's no disorder. 


#Entropy: E[D] = - sigma (Pi log Pi)

#Gini Index is a measure of homogeneity
#Entropy is a measure of chaos, entropy is maximum when Gini Index is minimum
# Entropy is zero when any pi =1

#The entropy is given by
#??[D]=??????i=1k pilog2pi,
#where p _i is the probability of finding a point with the label i, k is the number of different labels, and 
#??[D] is the entropy of the data set D.

#The entropy is a measure of disorderness, while the Gini index is a measure of homogeneity in the data set. The lesser the disorder, 
#the lower the entropy and the greater the homogeneity; and hence, the Gini index is higher.

#information gain: It measures how much the entropy has decreased between the parent set and the partitions obtained after splitting


#The information gain is equal to the entropy change from the parent set to the partitions. 
#So it is maximum when the entropy of the parent set minus the entropy of the partitions is maximum.


#Gain(D,A)=??[D]?????[DA]=??[D]??????i=1k((DA=iD)?????[DA=i]),

#where 


#??[D] is the entropy of the parent set D (data before splitting), 

#??[DA] is the entropy of the partitions obtained after splitting on attribute A, 

#??[DA=i] is the entropy of the partition where the value of attribute A for the data points is i, 

#DA=i is the number of data points for which the value of attribute A is i, and k is the number of different labels.

# You split on the attribute that maximises the information gain. 

####################################################################################################################
#Decision tree regression
#split the data such that the:
#R2 of the partitions obtained after splitting is greater than that of the original or parent data set. 
#In other words, the fit of the model should be as 'good' as possible after splitting.
#if you get a data set where you want to perform linear regression on multiple subsets, decision tree regression is a good idea.
#R2 is used to measure the homogeneity in regression, where the target variable is continuous.
#Leaves in decision tree regression contain models.
#R2 gives a sense of how good or bad the linear regression fit is.
#Sometimes a single linear regression model is not good enough to perform the regression task, so you split the data into smaller chunks and assign one linear regression model to each chunk.
#Decision tree regression and classification are similar in the sense that both try to pick an attribute (for splitting) that maximises the homogeneity of the data set.

#First, decide if it's a classification problem or a regression problem.
#Then, select a homogeneity measure for splitting, and select the first attribute for splitting out of the many. 
#After this, split the original data set on the selected attribute, and keep splitting till you get a sufficiently high 
#R2. Once you stop splitting, you will get leaves containing linear regression models.
#The higher the R2, the better the regression model.

######################################################################
#summary:
#the following steps are involved in decision tree construction:
  
#A decision tree first decides on an attribute to split on.
#To select this attribute, it measures the homogeneity of the nodes before and after the split.
#There are various ways in which you can measure the homogeneity.
#You have the Gini index and information gain for classification; you also have R2 for the regression, to measure the homogeneity.
#The attribute that results in a maximum homogeneous data set is then selected for splitting.
#Then, this whole cycle is repeated till you get a sufficiently homogeneous data set.

  

