function wert_dbasis = LagrangeDerivBasis(x,n,i,x_node)

    wert_dbasis = 0;
    for m = 1:n+1
        if m ~= i
            wert_mlti = 1;
            for k = 1:n+1
                if k~=i && k~=m
                    wert = (x - x_node(k,:))/(x_node(i,:)-x_node(k,:));
                    wert_mlti = wert_mlti*wert;
                end
            end
           wert_dbasis = wert_dbasis+ wert_mlti/(x_node(i,:)-x_node(m,:));
       end
    end



end
