function res = N1N2detJ(nodes,xi,eta)
    N1N2 = (1-eta)*(1-xi)/16;
    [~,detJ,~] = getJacobian(nodes,xi,eta);
    res = N1N2*detJ;
end