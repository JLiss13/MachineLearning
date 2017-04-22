function [pass , maxErr] = grad_check(fun , sizeVec , rep , tol ) 
%Check the gradient of the loss function
    if nargin < 4
        tol = 1E-6; %set the default value 
    end
    maxErr = 0;
    for i = 1 : rep
        w0 = randn ( sizeVec (1) , sizeVec (2) ) ; % the gradient would be computed in this random point
        [g1] = gradest(fun, w0); %receive the numerical estimation of gradient (slow)
        [f, g2] = fun(w0); %receive the gradient
        maxErr = max(maxErr, abs(g1(:) - g2(:))); %compute the difference between computed & estimated gradients
    end
    if maxErr < tol 
        pass = 1;
    else
        pass = 0;
    end
end