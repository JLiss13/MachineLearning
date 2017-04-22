function [xvals, fvals] = gradient_decent(func, x0, options) 
    % xvals -> row i + 1 is the value of x at iteration i
    % fvals -> row i + 1 is the value of func(x) at iteration i
    [ftemp,G]=func(x0);
    xvals=x0';
    for i=1:options.NumIterations      
        xvals(i+1,:)=xvals(i,:)-options.Stepsize.*G';
        fvals(i+1)=ftemp;
        [ftemp,G]=func(xvals(i+1,:)');
    end
end