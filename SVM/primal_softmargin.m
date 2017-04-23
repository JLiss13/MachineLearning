function [w, b] = primal_softmargin(X, y, beta) % Receives :
% Xa(txn)matrix
[xrow,xcol]=size(X);
diag_y=diag(y);
% beta a scalar regularization parameter beta %s
H = [beta.*eye(xcol),zeros(xcol,xrow+1);zeros(xrow+1,xcol),eye(xrow+1)];
size(H);
eig_H=eig(H);
A_temp=[diag(y)*X];
A=-[A_temp,diag(y)*ones(xrow,1),eye(xrow);zeros(xcol+1,xrow+xcol+1)];

f = ones(xrow+xcol+1,1);
%slack
b = [ones(xcol+1,1);zeros(xrow,1)];
x = quadprog(H,f,A,b); %x=[w1, w2, w3 ... b]
% Returns :
% n x 1 vector of weights w
% b a scalar offset
w=x(1:xcol,:);
b=x(xcol+1:xcol+1,:);
end