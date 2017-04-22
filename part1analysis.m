function [L_model1,L_model2,L_model3]=part1analysis(W2total,W1total,Woototal,y,y1,y2,X)
    for m=1:3
        L_1errorm1(1,m)=norm(X*W1total(:,m)-y,1);
        L_2errorm1(1,m)=norm(X*W1total(:,m)-y);
        L_inferrorm1(1,m)=norm(X*W1total(:,m)-y,Inf);
        L_model1=[L_1errorm1',L_2errorm1',L_inferrorm1'];

        L_1errorm2(1,m)=norm(X*W2total(:,m)-y1,1);
        L_2errorm2(1,m)=norm(X*W2total(:,m)-y1);
        L_inferrorm2(1,m)=norm(X*W2total(:,m)-y1,Inf);
        L_model2=[L_1errorm2',L_2errorm2',L_inferrorm2'];

        L_1errorm3(1,m)=norm(X*Woototal(:,m)-y2,1);
        L_2errorm3(1,m)=norm(X*Woototal(:,m)-y2);
        L_inferrorm3(1,m)=norm(X*Woototal(:,m)-y2,Inf);
        L_model3=[L_1errorm3',L_2errorm3',L_inferrorm3'];
    end
end

