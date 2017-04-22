% minL1(X, y)
function W = minL1(X, y)
    [xr,xc] = size(X);
    [yr,yc] = size(y);
    Ipos = eye(xr);
    Ineg = Ipos*(-1);
    A=[[X,Ineg];-[X,Ipos]]; 
    f=[zeros(xc,1);eye(xr,1)]; % Objective function
    b=[y;-y];
    P = linprog(f,A,b);
    W= P(1:xc,:);
end
