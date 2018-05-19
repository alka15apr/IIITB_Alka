#SVMs are capable of dealing with incredibly complex problems, where models such as logistic regression typically fail.
#SVMs have been extensively used for solving complex classification problems such as image recognition, voice detection etc.
#SVMs are mostly used for classification tasks, but they can also be used for regression
#SVMs belong to the class of linear machine learning models (logistic regression is also a linear model)
#A linear model uses a linear function (i.e. of the form y = ax +b) to model the relationship between the input x and output y. 
#For example, in logistic regression, the log(odds) of an outcome (say, defaulting on a credit card) is linearly related to the attributes x1, x2, etc.
#log(odds of default)=  ??0 +  ??1x1 +??1x2+....??nxn

#SVMs need attributes in the numeric form. 

#In our (somewhat simplified) example of email classification, the features are the 'frequency of words' in an email.
#Word frequency is a very common type of feature in text classification, and reasonably so. 
#For example, words such as 'Hurry', 'FREE' and 'Discount' are likely to be more frequent in spam emails than 'meeting', 'PPT', 'weekly report', and others that are characteristic of office emails. 

#To summarise, SVMs are linear models that require numeric attributes. 
#In case the attributes are non-numeric, you need to convert them to a numeric form in the data preparation stage.

#concept of hyperplanes
#it is a boundary which classifies the data set(classifies spam email from the ham ones).
#It could be lines, 2D planes, or even n-dimensional planes that are beyond our imagination.
#A line that is used to classify one class from another is also called a hyperplane.
#the hyperplane in 2D can be represented by a line, whereas a hyperplane in 3D can be represented by a plane.
#The dimension of the hyperplane is calculated as [number of features - 1]. 
#In 3 dimensions the hyperplane will be a plane with an expression of ax+by+cz+d = 0.
#In general, if you derive the d-dimensional hyperplane from d attributes, you can write the expression as follows:
#???i=1d(Wi.Xi)+W0=0  The model denoted by the expression is called a linear discriminator.
#Similar to the 2D and 3D expressions, an n-dimensional hyperplane also follows the general rule: all points above the plane will yield a value greater than 0, and those below it will yield lesser than 0 when plugged into the expression of the hyperplane.
# if l1= 1 then, ???i=1d(Wi.Xi)+W0 >0   
# if l1= -1 then, ???i=1d(Wi.Xi)+W0 <0
#If there are n features, the equation of the hyperplane will be the additive sum of 
#xn features multiplied by  Wn coefficients. The number of data points does not affect the hyperplane equation. For example, with two features, say 
#x1 and x2 , the equation of the hyperplane will be a straight line - i.e. 
#W0+W1x1+W2x2=0, where 
#W0 is the intercept.
#The equation of the hyperplane is given by W0 + W1X1 + W2X2 + . . . + WnXn in an n-dimensional space. If a point is exactly on the hyperplane, it will be equal to zero.



#The standard equation of a line is given by ax+by+c = 0.
#You could generalise it as 
#W0+W1x1+W2x2=0, where x1 and x2 are the features - such as 'word_freq_technology' and 'word_freq_money' - and 
#W1 and  W2 are the coefficients.
#For any line with W coefficients, substituting the value of features 
#x1 and  x2 in the equation of the line determined by its W coefficients, will return a value. 

#A positive value (blue points in the plot above) would mean that the set of values of the features is in one class; however, a negative value (red points in the plot above) would imply it belongs to the other class. 
#A value of zero would imply that the point lies on the line (hyperplane) because any point on the line will satisfy the equation: W0+W1x1+W2x2=0.



## Maximum margin classifier
#The Maximal Margin Classifier divides the data set in such a way that it is equidistant from both the classes.
#Thus, it maintains an equal distance from both classes, making the model less biased to the training data. Also, training errors are reduced.
# the best line is the one that maintains the largest possible equal distance from the nearest points of both the classes, that also referred as a Maximal Margin Classifier.
# a hyperplane is basically defined by its weights. We try to find the hyperplane, or the weights, such that the margin is maximum.
# the mathematical formulation requires two major constraints that need to be taken into account while maximising the margin.
#1)The standardisation of coefficients such that the summation of the square of the coefficients of all the attributes is equal to 1. For example, if you have 20 attributes, then the summation of square of the coefficients should be  
#???i=020(Wi2)=1
#Along with the first constraint, the maximal margin hyperplane should also follow the constraint given below:

#(liX(Wi.Yi))???M

#where, 
#li = label (1, -1)
#Wi = coefficient of attributes
#Yi  = data points of all the attributes  each row 

# hyperplane equation is represented as W0+W1X1+W2X2=0. 
#So what you need to do is apply both the constraints in this equation such that you get a maximal margin hyperplane equation that maintains an equal distance from both the labels, 

#The Maximal Margin Classifier is better than the others because it maintains an equal distance from both the classes; this performs better on the test set.
#The margin should be selected in such a way that it has the maximum distance from both the classes. For example, if you want to categorise spam and ham by a plane, then the plane should be drawn in such a way that it is equally set apart from both the classes, i.e. 'spam' and 'ham'.


# SVMs belong to the class of linear machine learning models.

#A linear model uses a linear function (i.e. of the form y = ax + b) to model the relationship between the input x and output y. 
#As you learnt in logistic regression, the log(odds) of an outcome (say, defaulting on a credit card) is linearly related to the attributes x1, x2, etc. Similarly, SVMs are also linear models. 

# A hyperplane is used to divide data points into two halves, as you saw in our example: you classified spam and ham emails into two halves. 
#But since there are various hyperplanes possible, you need to choose the 'best one'. 
#The Maximal Margin Classifier is the best hyperplane that maintains an equal distance from the closest points in both the classes. 
#This distance is called the margin.

#The Maximal Margin Separator is more generalisable because it takes ensures a minimum margin of safety from both the classes; this makes the model less biased towards any one of the classes.

#Support vectors:
# support vectors are the points that lie close to the hyperplane. 
#In fact, they are the only points that are used in constructing the hyperplane.
#SVCs((Support Vector Classifiers)) are relatively immune to outliers, because SVCs are formulated from the support vector points. 
#It implies that the SVC (i.e hyperplane) will not be changed if we do not change the support vectors.

#*Can you say that SVCs((Support Vector Classifiers)) are relatively immune to outliers? 
#Yes, because SVCs are formulated from the support vector points. It implies that the SVC (i.e hyperplane) will not be changed if we do not change the support vectors.

#Support vector classifiers
#The hyperplane that allows certain points to be deliberately misclassified is also called the Support Vector Classifier. 
#The support vector classifier works well when the data is partially intermingled (i.e. most of the data can be classified correctly with some misclassifications).
#Similar to the Maximal Margin Classifier, the Support Vector Classifier also maximises the margin; but it will also allow some points to be misclassified
#Only the data points that lie closest to the hyperplane are useful for constructing the support vector  classifier.


#Slack variable
#A slack variable is used to control misclassifications. It tells you where an observation is located relative to the margin and hyperplane.
#For points which are at a distance of more than Margin, i.e. at a safe distance from the hyperplane, the value of the slack variable is 0. 
#On the other hand, if a data point is correctly classified but falls inside the margin (or violates the margin), then the value of its slack ?? is between 0 and 1.
#Finally, if a data point is incorrectly classified (i.e. it violates the hyperplane), the value of epsilon (??) > 1. The incorrectly classified blue and red points are such examples. 
#Each data point has a slack value associated to it, according to where the point is located.
#The value of slack lies between 0 and +infinity.
#Lower values of slack are better than higher values (slack = 0 implies a correct classification, but slack > 1 implies an incorrect classification, whereas slack within 0 and 1 classifies correctly but violates the margin).
#Once you understand the notion of the slack variable, you can easily compare any two Support Vector Classifiers. You can measure the summation of all the epsilons(??) of both the hyperplanes and choose the best one that gives you the least sum of epsilons(??). The summation of all the epsilons of each data point is denoted by cost or 'C', i.e.
#?????i???C.
#When C is large, the slack variables can be large, i.e. you allow a larger number of data points to be misclassified or to violate the margin. So you get a hyperplane where the margin is wide and misclassifications are allowed. In this case, the model is flexible, more generalisable, and less likely to overfit. In other words, it has a high bias. 
#n the other hand, when C is small, you force the individual slack variables to be small, i.e. you do not allow many data points to fall on the wrong side of the margin or the hyperplane. So the margin is narrow and there are few misclassifications. In this case, the model is less flexible, less generalisable, and more likely to overfit. In other words, it has a high variance. 


#Notion on slack variable
#the mathematical formulation for the Maximal Margin Classifier can be expressed as li X (W .Yi)>=M
#where
#li represents the label of the ith observation (such as spam(+1) and ham(-1));
#W represents the vector of the coefficients (or weights) of each attribute (for example, if you have 3 attributes, W = [w0, w1, w2, w3]).

##Yi represents the vector of the attribute values for the ith row, e.g. Y = [y1, y2, y3] for 3 attributes.
#Thus, the dot product 

#W.Yi is simply the value of the expression obtained by putting the ith data point in the hyperplane equation, i.e. 

#W.Yi=w0+w1y1+w2y2+w3y3.

#Thus, 

#W.Yi is lesser than, equal to or greater than 0, depending on the location of the ith data point with respect to the hyperplane. Also, note that the value of 

#W.Yi gives you the distance of the ith data point from the hyperplane.

#M represents the margin, i.e. the distance of the closest data point from the hyperplane.


#If you impose the condition 

#(liX(W.Yi)>=M) on the model, then you are implying that you want each point to be at least a distance M away from the hyperplane.
#But unfortunately, few real datasets will be so easily, perfectly separable. Thus, to relax the constraint, you include a 'slack variable' 

#??i for each data point i.
#Thus, you modify the formulation to 

  #(liX(W.Yi)>=M(1?????i),
    
     #Where the slack variable 
      
      #??i takes a value between 0 to infinity.
    
#Depending on the value of 

#??i, the ith data point can now take any position - it can fall on the correct side of the margin (and a safe distance away), or inside the margin (but still correctly classified), or even stray on the wrong side of the hyperplane itself.
    
#If C is large, then the slack variables ??i can take higher values. And you know that when slack(??i) > 1, the point is misclassified, between 0 and 1, it falls inside the margin, and when slack(
#??i) = 0, it is correctly classified. Thus, for higher C, more points will be allowed to get misclassified or fall inside the margin (compared to a lower C). 
#On the other hand, a lower C implies that each slack(??i) will have to take a lower value, and thus not be allowed to stray on the other side of the margin or the hyperplane. This is a more strict condition. In other words, a lower C does not give the model freedom to misclassify even a few points, and thus the model tries to overfit the data.


#Cost of misclassification
#C is the sum of all the values of slack variables
# The parameter cost of misclassification (C) represents the cost of violations to the margin and the hyperplane.
#Thus, the parameter C is called the tuning parameter - one of the hyperparameters in SVM.
#So to summarise, misclassification can be controlled by the value of cost or C. 
#If C is large, the slack variables (epsilons( ??)) can be large, i.e. you allow a larger number of data points to be misclassified or violate the margin; and if C is small, you force the individual slack variables to be small, i.e. you do not allow many data points to fall on the wrong side of the margin or the hyperplane.


#penality for misclassification
#****the parameter C that you used in the SVM formulation and the c in the ksvm() function are the inverse of each other.
#in the ksvm() implementation of R that you will use, the hyperparameter c is analogous to the penalty imposed for misclassification, i.e. a higher c will force the model to classify most data points correctly (and thus, overfit). 
#Although the value of the hyperparameter c is chosen using cross-validation
#In ksvm(), c represents the 'penalty for misclassification'. 

#The svm function of the ksvm package also has a parameter called 'scaled'. 
#The main advantage of scaling is to avoid attributes in greater numeric ranges dominating those in smaller numeric ranges.
#Another advantage is to avoid numerical difficulties during calculation. 

#Hence, the value of the cost argument (which is essentially the tuning parameter c in the svm function) doesn't need to be so high that it overfits the training data; it also shouldn't be so low that it makes it highly biased.
#Rather, it needs to be at a certain level where it is able to generalise well on unseen data. 
#Cross-validation and hyperparameter tuning can help you select the value of c.


#kernels
#kernels are 'toppings' over the linear SVM model, which somehow enable the model to separate nonlinear data
#you can transform nonlinear boundaries to linear boundaries by applying certain functions to the original attributes. 
#The original space (X, Y) is called the original attribute space, and the transformed space (X', Y') is called the feature space.


#The transformation from the 2-D attribute space resulted in a linearly separable feature space which is 6-D, i.e. the number of dimensions have increased. In theory, this looks fine. But what practical problems do you think this can cause?
#Ans A higher number of features will increase the computational cost

#there is an exponential increase in the number of dimensions when you transform the attribute space to a feature space. This makes the modelling (i.e. the learning process) computationally expensive.

#kernels are functions which help you transform non-linear datasets. Given a dataset, you can try various kernels, and choose the one that produces the best model. The three most popular types of kernel functions are: 
#The linear kernel: This is the same as the support vector classifier, or the hyperplane, without any transformation at all
#The polynomial kernel: It is capable of creating nonlinear, polynomial decision boundaries 
#The radial basis function (RBF) kernel: This is the most complex one, which is capable of transforming highly nonlinear feature spaces to linear ones. It is even capable of creating elliptical (i.e. enclosed) decision boundaries


#the linear kernel, also known as the hyperplane, requires one tuning parameter, i.e. 'c' to select the best-fit linear model.
# If you choose the RBF kernel, you'll need to choose two tuning parameters: sigma and 'c'. 
#As the value of sigma increases, the model complexity increases.
#cross-validation is the best way to choose the best combination of these hyper parameters i.e sigma and 'c'. 
#Sigma can be any real number, whereas C, being cost, needs to be a positive number.
#A higher value of 'c' ( tuning parameter i.e used in ksvm() in R lab) will not allow any points to be misclassified. The SVM model will be overfitting when there is no misclassification.
# A higher value of gamma will add more nonlinearity to the decision surface. The SVM model will be overfitting when no points are misclassified, and the nonlinearity is highly introduced than required.

#selecting the kernel type

#If the kernel is highly nonlinear, the model is likely to overfit. On the other hand, if the kernel is too simple, then it may not fit the training data well. 
#Usually, it is difficult to choose the appropriate kernel by visualising the data or using exploratory analysis
#Thus, cross-validation (or hit-and-trial, if you are only choosing from 2-3 types of kernels) is often a good strategy.



