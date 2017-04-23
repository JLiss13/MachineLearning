import tensorflow as tf
import numpy as np
###############################################################################
# Create the tensor x of the value 
#   [[[2, -2, 4], [0, 1, 2]], [[1, 2, 3], [7, 1, 9]]] 
# and y as a tensor of ones with the same shape as x.
# Return a Boolean tensor that yields Trues with the same shape as x and y if 
# x equals y element-wise.
# Hint: Look up tf.equal().
###############################################################################
def p1():
    x = np.array([[[2, -2, 4], [0, 1, 2]], [[1, 2, 3], [7, 1, 9]]] )
    y = np.ones(np.shape(x))
    trueorfalse=tf.equal(x,y)
    return trueorfalse

################################################################################
# Creates one variable 'x' of the value [3., -4.] and a placeholder 'y' of the 
# same shape as 'x'. Given a scalar z returns a triple containing 
#   x
#   y 
#   and a TensorFlow object that returns x + y if z > 0, and x - y otherwise. 
# Hint: Look up tf.cond().
################################################################################
def p2(z):
    x = tf.Variable([3., -4.],tf.float32)
    y = tf.placeholder(tf.float32)
    def fun1(): return tf.add(x,y)
    def fun2(): return tf.subtract(x,y)
    # z = tf.placeholder(tf.bool, shape=[])
    # z = tf.constant(z,tf.float32)
    output = tf.cond(tf.greater(z,0), fun1, fun2)
    print(output)
    return x, y, output

###############################################################################
# Given 2d tensors x, y, and z, returns a tensor object for  x' * y^-1 + z 
# where x' is the transpose of x and y^-1 is the inverse of y. The dimensions 
# of tensors will be compatible.
# Hint: See "Matrix Math Functions" in TensorFlow documentation.
###############################################################################
def p3(x, y, z):
    output = tf.matrix_transpose(x) * tf.matrix_inverse(y) + z
    print(output)
    return output

###############################################################################
# Given a TensorFlow object that describes a convex function and a TensorFlow 
# session, return the the minimum value of the function found by gradient 
# decent. Use 0.01 learning rate and 10000 steps. 
###############################################################################
def p4(objective_function, sess):
    train_step = tf.train.GradientDescentOptimizer(0.00001).minimize(objective_function)
    # tf.global_variables_initializer().run()
    for _ in range(1000):
        sess.run(train_step)
    return objective_function

