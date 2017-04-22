function [f , G] = simple_quadratic (x)
    f=(3.*x(1,:)-9).^2+(x(2,:)-4).^2;
    G=[6.*(3.*x(1,:)-9);2.*(x(2,:)-4)];
    % Compute the value of f and G based on input x.
end
