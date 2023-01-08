function [sysmat,rhs] = assignDBC(sysmat,rhs,dbc)
    nodes = dbc(:,1);
    wert = dbc(:,2);
    for i = 1:size(nodes,1)
        sysmat(nodes(i),:) = zeros(size(sysmat,1),1);
        sysmat(nodes(i),nodes(i)) = 1;
        rhs(nodes(i)) = wert(i);
    end

end