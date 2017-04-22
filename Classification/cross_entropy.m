function [f,G]=cross_entropy(X,w,y)
    z=sigmoid(X*w);
    G=X'*(z-y);
    [xlen,ylen]=size(y);
    for i=1:xlen
        l(i)=-y(i)*log(z(i))-(1-y(i))*log(1-z(i));
    end
    f=sum(l);
end