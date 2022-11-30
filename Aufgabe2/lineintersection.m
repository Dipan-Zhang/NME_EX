function x_num = lineintersection(P1,P2)

    x_num = (P2(1,:)-P1(1,:))/(P2(2,:)-P1(2,:))*(2-P1(2,:))+P1(1,:);
   
end
