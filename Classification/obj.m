function [f, G] = obj(X, w, y, b)
    [f1 , G1] = cross_entropy (X, w, y) ; % apply loss function 
    [f2, G2] =l2_reg(w); % apply regularizer
    % 'b' is the regularization param
    f = f1 + b*f2; % add value of loss and regularizer
    G = G1 + b*G2; % add gradient of loss and regularizer wrt w 
end