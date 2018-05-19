#Neural Networks, or Artificial Neural Networks, are a collection of a large number of simple devices called artificial neurons. 
#an artificial neuron can take multiple inputs (which are outputs of other neurons). On the cumulative weighted sum of the inputs, the activation function is applied to get the output from that neuron. 
#This output can then be fed as input to multiple other neurons
# The weights and the biases act as inhibitors or amplifiers for the inputs.
#Neurons in a neural network are arranged in layers. The first and the last layer are called the input and output layers.
#Input layers have as many neurons as the number of attributes in the data set and
#output layer has as many neurons as the number of classes of the target variable (for a classification problem).
# For a regression problem, the number of neurons in the output layer would be 1.

#Before you can start working with neural networks you need to specify a few things:
#Structure of the network
#Activation Function
#The number of neurons in the input and output layers

#A network thus contains:
#Input and output layers (number of neurons)
#The weights of all connections
#The bias of each neuron
#The activation function of each neuron


#Neural networks are quite popular in image recognition problems. 
#The task is to classify a given image (say a Google image) into categories like nature, animal, and sports. 
#An image is just a collection of pixels. In a 720 x 1080 image, for example, there are 720 pixels along the vertical of the image and 1080 along the horizontal. 
#Each pixel acts as an attribute and contains a 'value' which may represent the color, shade etc. at that point on the image.


#In linear / logistic regression and SVMs, we train the model on the coefficients, i.e. find the optimal values of the coefficients to minimise some cost function. 
#Neural networks are no different - they are trained on weights and biases.  

#The neural network learning algorithm, when it's being trained on data, fits various models to the training data and selects the best model for prediction. 
#The learning algorithm is trained with a fixed network structure, activation functions and input and output layers.
#It is trained on the weights and the biases.

#This implies that the best model is the optimal set of the weights and the biases. 
#The structure, activation functions and input and output layers remain the same, and thus these are the hyperparameters. 


#The process of finding the best combination of weights and biases is computationally very expensive. 
#Therefore, we have to make some simplifications and make a few assumptions. 


#The assumptions for the most common neural network architecture are as follows:
#The neurons are arranged in layers and the layers are arranged sequentially.
#The neurons within a layer do not interact with each other.
#All the inputs enter the network through the input layer and all the outputs go out of the network through the output layer.
#Neurons in consecutive layers are densely connected. This means that all the neurons in layer l_{i} are connected to all the neurons in layer l_{i+1}  and layer l_{i-1}.
#For every interconnection in the neural network there is a weight associated with it and for every neuron there is a bias associated with it.
#All the layers between the input and the output layers are known as the hidden layers.
#There can only be an interconnection between neurons of adjacent/consecutive layers.

#To specify a network completely means to specify all of these elements:
#The number of neurons in each layer and the number of layers
#The activation function 
#A list of biases for each layer
#A weight matrix for each pair of layers.


#The first two elements are used by the learning algorithm to generate the neural network, i.e. they are specified by the network designer beforehand as hyperparameters.
#The learning algorithm then tunes the weights and biases to produce the best model.
#Remember (the simplifying assumption) that the entire network has the same activation function.  
#Activation function is fixed by the network creator and then the learning algorithm uses this activation function to generate output from neurons, eventually tuning the weights and the biases.


#Training a network means:Given the number of layers and neurons, find the optimal weights and biases such that the cost is minimized

#To strike the correct architecture, you need to find the best combination of the number of layers in the network and the number of neurons in each layer. 
#Also, you must choose an activation function.

#Essentially, activation function could be any function but it should have some properties. They are:

#Activation functions should be smooth i.e. they should have no abrupt changes when plotted.
#They should also make the inputs and outputs non-linear with respect to each other to some extent. 
#This should be ensured because non-linearity helps in making neural networks more compact. 

#The most popular activation functions used for neural networks are:

#Logistic function - f(y) = \frac{1}{1 + e^{-y}}
#Hyperbolic tangent function - tan h(y) =\frac{e^{x} - e^{-x}}{e^{x} + e^{-x}}
#Rectilinear Unit - y = x \forall x \geq 0 \& 0 otherwise.


#There are various problems you face while trying to recognise handwritten text using an algorithm such as:
#Noise in the image
#Orientation of the text
#Non-uniformity in the spacing of text
#Non-uniformity in handwritings. 

#The process of computing output from the input is called feedforward or inference.
#a_{0} is the input to the network
#The network has h hidden layers and the h+1^{th} layer is the output layer.
#The weight matrix for layer l is of the order n_{l}Xn_{l-1}
#The bias vector for layer l has n_{l} elements.

#The output from the network will be calculated in a sequential manner. 
#Given the input a_{0} to the network, you multiply the input vector with the matrix w_{1} and add the bias vector b_{1} to get the cumulative input z_{1}. 
#Activation function is then applied to z_{1} to give \sigma(z_{1}) which is the output of layer 1 (or the input to layer 2).
#The input to layer 2 is now a_{1}. You multiply a_{1} with w_{2}, add the bias vector b_{2}. 
#This becomes z_{2} and upon applying activation to this you get the output of layer 2. 


You can continue this process till you get the output of the last layer.
