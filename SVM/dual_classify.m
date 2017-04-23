function [yhat] = dual_classify(Ktest, lambda, b, y, beta) % Inputs :
% Ktest : te x t matrix of test kernel matrix
% lambda: t x 1 vector of Lagrange multipliers
% b: a scalar offset
% y: t x 1 vector of training labels
% beta : a scalar regularization parameter % Output :
% yhat : te x 1 vector of class labels
[krow,kcol]=size(Ktest);
yhat=sign(Ktest*diag(y)*lambda*1./beta+b.*ones(krow,1));
end