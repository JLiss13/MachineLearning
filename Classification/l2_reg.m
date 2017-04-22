function [f,G]=l2_reg(w)
    f=norm(w)^2;
    G=2*w;
end