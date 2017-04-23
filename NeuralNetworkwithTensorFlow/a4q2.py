import tensorflow as tf
import numpy as np

# Inputing File
a4q2_test=np.genfromtxt("a4q2_test.txt")
a4q2_train=np.genfromtxt("a4q2_train.txt")
xtr1=a4q2_train[:,0]
xtr2=a4q2_train[:,1]
xte1=a4q2_test[:,0]
xte2=a4q2_test[:,1]
ytr=a4q2_train[:,2]
yte=a4q2_test[:,2]


# Feature determination
featurestr = [tf.contrib.layers.real_valued_column("xtr1", dimension = 1), tf.contrib.layers.real_valued_column("xtr2", dimension = 1)] # Need to add a feature param for each column
#These features are shared between both the training and test data
# featureste = [tf.contrib.layers.real_valued_column("xte1", dimension = 1), tf.contrib.layers.real_valued_column("xte2", dimension = 1)]

# Determine the regressor (linear)
estimator = tf.contrib.learn.LinearRegressor(feature_columns=featurestr)

#Turn all inputs into numpy inputs
input_fe_tr = tf.contrib.learn.io.numpy_input_fn({"xtr1":xtr1, "xtr2":xtr2}, ytr, batch_size=100,num_epochs=10000) #num_epochs = number of iterations batch_size = size of cross correlation datasets

# Fit model
estimator.fit(input_fn=input_fe_tr, steps=8801) #steps = number of steps
#
# Evaluate accuracy.
print(estimator.evaluate(input_fn=input_fe_tr))

# Test Evaluate accuracy.
input_fe_te = tf.contrib.learn.io.numpy_input_fn({"xtr1":xte1, "xtr2":xte2}, yte, batch_size=100,num_epochs=10000)
print(estimator.evaluate(input_fn=input_fe_te))