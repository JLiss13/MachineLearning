function [yhat, phat] = classify(X, w)
    phat=sigmoid(X*w);
    for i=1:length(phat)
          if phat(i) > 0.5
            yhat(i)=1;
          else
            yhat(i)=0;
        end
    end
    % X is a matrix of training / test data and w is the learned weights 
    % Returns prediction yhat in {0, 1} and the probability of being amalignant case phat for each example .
end