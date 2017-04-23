function [yhat] = margin_classify(Xtest , w, b) 
% Receives :

% Xtest: (te x n) test data matrix,
%w: (n x 1) vector of weights,
%b:ascalar,
yhat=sign(Xtest*w +b);
% Returns :
% yhat: (te x 1) vector of predicted target classes on the test patterns
%Experiments
end
