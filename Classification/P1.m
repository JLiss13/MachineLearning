% Part 1 
clc
clear all
close all
format long

s=load('a2q1.mat');
x_tr=s.X_train;
y_tr=s.y_train;
x_te=s.X_test;
y_te=s.y_test;
% w=x_tr\y_tr;
w=randn(1,30)';
%% (ii) Sigmoid Fun
f1=sigmoid([-10:10]);
figure('Name','Sigmoid')
plot([-10:10],f1);
title('Sigmoid')
xlabel('[-10, 10]')
ylabel('Sigmoid Output')
b = 0.01;
%% (iii) 
[f,G]=cross_entropy(x_tr,w,y_tr);
%% (iv)
[f,G]=l2_reg(w);
%% (v)
b=0.0001;
[f, G] = obj(x_tr, w, y_tr, b);
%% (vi)s
[pass , maxErr] = grad_check(@l2_reg,[1,10],5, 0.001); % 
% [pass , maxErr] = grad_check(@cross_entropy,[1,10], 1) % 
%% (vii)
[wOpt, Objval] = trainLogisticReg(x_tr, y_tr, b);
%% (viii)
[yhat, phat] = classify(x_te, wOpt);
accuracytest = compute_accuracy(y_te, yhat)

[yhat, phat] = classify(x_tr, wOpt);
accuracytrain = compute_accuracy(y_tr, yhat)
%save_all_figures_to_directory('/Users/Jaliss/Documents/UCSC/CMPS_142/Hw2/Deliverable/','Part_1')
