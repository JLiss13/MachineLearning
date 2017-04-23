function [lambda, b] = dual_softmargin(K, y, beta) % Inputs :
%K: t x t kernel matrix

[krow,kcol]=size(K);
% y: t x 1 vector of Lagrange multipliers 
% beta : scalar regularization parameter
diag_y=diag(y);
H=(1/(beta)).*diag_y*K*diag_y;
size(H);
eig_H=eig(H);
f=-ones(krow,1);
A=[];
b=[];
Aeq=y';
beq=0;
lb=zeros(krow,1);
ub=ones(krow,1);
lambda = quadprog(H,f,A,b,Aeq,beq,lb,ub);
% Returns :
% lambda t x 1 vector of Lagrange multipliers
b=(1./y(1,:))-K(1,:)*diag(y)*lambda.*(1/beta);
%b scalar offset
end