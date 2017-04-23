function [K] = poly_kernel(X1,X2,d)
% degree d polynomial kernel
%Input :
% X1 is a t1xn matrix of data examples % X2 is a t2xn matrix of data examples %Output :
% K is the t1xt2 kernel matrix .
fprintf('Using Polynomial Kernel \n');
[xrow,xcol]=size(X1);
K=(ones(xrow,1)+X1*X2').^d;
end