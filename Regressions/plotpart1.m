function [L_model1,L_model2,L_model3]=plotpart1(W2total,W1total,Woototal,y,y1,y2,X)
    for m=1:3
        strtitle=strcat('Generative Model_', num2str(m))
        figure('Name',strtitle)
        plot(X(:,2)', y', 'k*')
        hold
        plot([0 1], [W2total(1,m) sum(W2total(:,m))],'r-')
        plot([0 1], [W1total(1,m) sum(W1total(:,m))],'g-')
        plot([0 1], [Woototal(1,m) sum(Woototal(:,m))],'b-')
        
        title(strtitle)
        xlabel('x')
        ylabel('y')
        legend('Training Data','L2-Norm','L1-Norm','Loo-norm')

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
        save_all_figures_to_directory('/Users/Jaliss/Documents/UCSC/CMPS_142/Hw1/Deliverable/','Part_1')
    end
end

