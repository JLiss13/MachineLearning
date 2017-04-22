function [wOpt, Objval] = trainLogisticReg(X, y, b) 
    obj_func = @(w) obj(X, w, y, b);
    [t, n] = size(X);
    w0 = zeros(n, 1);
    options = optimoptions('fminunc','Algorithm','quasi-newton','GradObj','on'); % in Matlab
    % Note: Comment the above line in Octave and uncomment the following line
    % options = struct(Algorithm,quasi-newton,GradObj, on)
    % Passes the handle for objective function and an initial point to a solver to perform minimization
    [wOpt , Objval , exitflag , output ] = fminunc ( obj_func , w0, options);
end