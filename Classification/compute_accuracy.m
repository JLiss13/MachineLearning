function accuracy = compute_accuracy(y, yhat)
    format long
    accuracytemp=abs(yhat-y');
    numofhits=find(accuracytemp == 0);
    accuracy=length(numofhits)/length(accuracytemp);
    % Accuracy is the fraction of correctly classified examples
end