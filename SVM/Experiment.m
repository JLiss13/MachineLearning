clc
clear all
close all
format
warning off

%Experiments
beta=1; 
sigma = 10;
d=2;
i=1; %1 to 50 is 7 and 51 to 100 is 8
i_te=101; %1 to 100 is 7 and 101 to 200 is 8
s=load('A3Supplement/A3Supplement/dataA3Q1.mat');
x_tr=s.X;
y_tr=s.y;
x_te=s.Xtest;
y_te=s.ytest;
figure()
imagesc(reshape(x_tr(i,:),[16,16])')
figure()
imagesc(reshape(x_te(i_te,:),[16,16])');

[w, b] = primal_softmargin(x_tr, y_tr, beta);
[yhat] = margin_classify(x_tr, w, b); 
acc_p = compute_accuracy(y_tr, yhat);

[yhat] = margin_classify(x_te, w, b); 
acc_p_test = compute_accuracy(y_te, yhat);

%Linear Kernel
K_lin = linear_kernel (x_tr,x_tr);
[lambda_lin, b_lin] = dual_softmargin(K_lin, y_tr, beta);
[yhat] = dual_classify(K_lin, lambda_lin, b_lin, y_tr, beta);
acc_dual_lin = compute_accuracy(y_tr, yhat);

K_lin_test = linear_kernel (x_te,x_tr);
[yhat] = dual_classify(K_lin_test, lambda_lin, b_lin, y_tr, beta);
acc_dual_lintest= compute_accuracy(y_te, yhat);

%Poly Kernel
K_poly = poly_kernel (x_tr,x_tr,d);
[lambda_poly, b_poly] = dual_softmargin(K_poly, y_tr, beta);
[yhat] = dual_classify(K_poly, lambda_poly, b_poly, y_tr, beta);
acc_dual_poly= compute_accuracy(y_tr, yhat);

K_poly_test = poly_kernel (x_te,x_tr,d);
[yhat] = dual_classify(K_poly_test, lambda_poly, b_poly, y_tr, beta);
acc_dual_polytest= compute_accuracy(y_te, yhat);

%Gauss Kernel
K_gauss = gauss_kernel (x_tr,x_tr,sigma);
[lambda_gauss, b_gauss] = dual_softmargin(K_gauss, y_tr, beta);
[yhat] = dual_classify(K_gauss, lambda_gauss, b_gauss, y_tr, beta);
acc_dual_g= compute_accuracy(y_tr, yhat);
size(yhat);

K_gauss_test = gauss_kernel (x_te,x_tr,sigma);
[yhat] = dual_classify(K_gauss_test, lambda_gauss, b_gauss, y_tr, beta);
size(yhat);
acc_dual_gtest= compute_accuracy(y_te, yhat);

%Overview
B_O= [b_lin, b_poly, b_gauss];
Acc_O=[acc_p, acc_dual_lin,acc_dual_poly,acc_dual_g; ...
    acc_p_test, acc_dual_lintest, acc_dual_polytest, acc_dual_gtest];

dlmwrite('accuracy.txt',Acc_O,'delimiter',',')