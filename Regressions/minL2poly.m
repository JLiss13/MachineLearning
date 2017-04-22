function c = minL2poly(x, y, d)
    [t,xc]=size(x);
    X=ones(t,d+1);
    for i_d=1:d
        x_temp=x.^(d-i_d+1);
        X(:,i_d)=x_temp;
    end
    c=X\y;
end