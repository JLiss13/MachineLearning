%% Homework 1 CMPS 142 Machine Learning
clc
clear all
close all

warning off all

[L_model1,L_model2,L_model1test,L_model2test]=HW1Part2()

%Run 100 times
for i=1:100
    [L_model1,L_model2,L_model1test,L_model2test]=HW1Part2fun();
    L_model1mat(:,:,i)=L_model1;
    L_model1mat_avg_err=mean(L_model1mat,3);
    L_model2mat(:,:,i)=L_model2;
    L_model2mat_avg_err=mean(L_model2mat,3);
    L_model1testmat(:,:,i)=L_model1test;
    L_model1testmat_avg_err=mean(L_model1testmat,3);
    L_model2testmat(:,:,i)=L_model2test;
    L_model2testmat_avg_err=mean(L_model2testmat,3);
end

L_model1mat=[L_model1mat_avg_err,L_model1testmat_avg_err]
L_model2mat=[L_model2mat_avg_err,L_model2testmat_avg_err]