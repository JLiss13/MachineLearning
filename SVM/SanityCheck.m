clc
clear all
close all
format
warning off

%Sanity Check
n = 2; % dimension
t = 10; % training size
u = 2*ones(n,1); % target weights (models 1 & 2) 
v = 0.8*n; % target offset (models 1 & 2)
p_pos = 0.5; % prob of positive example
mu_pos = ones(n,1); % mean loc for pos (model 3) 
mu_neg = zeros(n,1); % mean loc for neg (model 3)
beta=1;
sigma=0.99; 
d=2;

X= rand(t,n);
y = sign(X*u-v);
 
[w, b] = primal_softmargin(X, y, beta);
Xtest=X;

[yhat] = margin_classify(Xtest , w, b);

%Q1.3

K_lin = linear_kernel (X,X);
[lambda_lin, b_lin] = dual_softmargin(K_lin, y, beta);
w_lin=(1/beta).*X'*diag(y)*lambda_lin;
y_lin=sign(X*w_lin);
K_poly= poly_kernel(X,X,d);
[lambda_poly, b_poly] = dual_softmargin(K_poly, y, beta);
w_poly=(1/beta).*X'*diag(y)*lambda_poly;
y_poly=sign(X*w_poly);
K_gauss = gauss_kernel(X,X,sigma);
[lambda_g, b_g] = dual_softmargin(K_gauss, y, beta);
w_g=(1/beta).*X'*diag(y)*lambda_g;
y_g=sign(X*w_g);

w_overview=[w,w_lin,w_poly,w_g]
y_overview=[y,yhat,y_lin,y_poly,y_g]
% [yhat] = margin_classify(Xtest , w, b)

X= rand(t,n);
y = sign (sin(X)*u-v);

[w, b] = primal_softmargin(X, y, beta);
Xtest=X;
[yhat] = margin_classify(Xtest , w, b);

%Q1.3

K_lin = linear_kernel (X,X);
[lambda_lin, b_lin] = dual_softmargin(K_lin, y, beta);
K_poly= poly_kernel(X,X,d);
[lambda_poly, b_poly] = dual_softmargin(K_poly, y, beta);
K_gauss = gauss_kernel(X,X,sigma);
[lambda_g, b_g] = dual_softmargin(K_gauss, y, beta);

X= rand(t,n);
y = 2*(rand(t,1) < p_pos) - 1; 

[w, b] = primal_softmargin(X, y, beta);
Xtest=X;
[yhat] = margin_classify(Xtest , w, b);

%Q1.3

K_lin = linear_kernel (X,X);
[lambda_lin, b_lin] = dual_softmargin(K_lin, y, beta);
K_poly= poly_kernel(X,X,d);
[lambda_poly, b_poly] = dual_softmargin(K_poly, y, beta);
K_gauss = gauss_kernel(X,X,sigma);
[lambda_g, b_g] = dual_softmargin(K_gauss, y, beta);


pos = find(y > 0);
neg = find(y < 0);
X(pos ,1) = X(pos ,1) + mu_pos(1); 
X(pos ,2) = X(pos ,2) + mu_pos(2); 
X(neg ,1) = X(neg ,1) + mu_neg(1); 
X(neg ,2) = X(neg ,2) + mu_neg(2);
 
%Experiments
imagesc(reshape(X(i,:),[16,16])')
beta=1, sigma =0.01, d=2
