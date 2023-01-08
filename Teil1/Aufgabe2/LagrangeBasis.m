function wert_basis = LagrangeBasis(x,n,i,x_node)
    %n # of order
    wert_basis = 1;
    for k = 1:n+1
       if k ~= i
           wert = (x - x_node(k,:))/(x_node(i,:)-x_node(k,:));
           wert_basis = wert_basis*wert;
       end
    end
    
end