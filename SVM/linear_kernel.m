function [K] = linear_kernel (X1,X2) %linear kernel
%Input :
%X1 is a t1xn matrix of examples %X2 is a t2xn matrix of examples %Output :
% K is the t1xt2 kernel matrix .
fprintf('Using Linear Kernel \n');
K=X1*X2';
end