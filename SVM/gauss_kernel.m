function [K] = gauss_kernel(X1,X2,sigma) % Gaussian kernel with sigma parameter
% Input :
format long
% X1 is a t1xn matrix of examples
% X2 is a t2xn matrix of examples % Output :
% K is the t1xt2 kernel matrix .
fprintf('Using Gauss Kernel \n');
d=pdist2(X1,X2);
K=exp(-(d.^2)/(2*sigma^2));
% K=K.*eye(xrow);
end