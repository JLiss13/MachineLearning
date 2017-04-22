%% Homework 1 CMPS 142 Machine Learning
function [L_model1,L_model2,L_model3,L_model1test,L_model2test,L_model3test]=Hw1Part1()
warning off all
%% Question 1

n=2;
t=10;
u = [0; ones(n-1,1)];
sigma = 0.1;
X = [ones(t,1) rand(t, n-1)];
y = X*u + randn(t,1)* sigma;
y1 = X*u + randn(t,1)./randn(t,1)*sigma;
y2 = X*u + randn(t,1) .* randn(t,1)*sigma;

% Part a
disp('PART 1')
W=minL2(X,y);
W1=minL2(X,y1);
W2=minL2(X,y2);

W2total=[W,W1,W2];

% Part b
disp('PART 2')
W=minL1(X, y);
W1=minL1(X, y1);
W2=minL1(X, y2);

W1total=[W,W1,W2];

%Part c

disp('PART 3')
Woo=minLoo(X, y);
W1oo=minLoo(X, y1);
W2oo=minLoo(X, y2);
Woototal=[Woo,W1oo,W2oo];
%Part da&b

%Part 1dc
% Plot weights on top of training data
[L_model1,L_model2,L_model3]=plotpart1(W2total,W1total,Woototal,y,y1,y2,X); 


% Part 1dd
% Checks error with test data
n=2;
t=1000;
u = [0; ones(n-1,1)];
sigma = 0.1;
X = [ones(t,1) rand(t, n-1)];
y = X*u + randn(t,1)* sigma;
y1 = X*u + randn(t,1)./randn(t,1)*sigma;
y2 = X*u + randn(t,1) .* randn(t,1)*sigma;
[L_model1test,L_model2test,L_model3test]=part1analysis(W2total,W1total,Woototal,y,y1,y2,X);
end

