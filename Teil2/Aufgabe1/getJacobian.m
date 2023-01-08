
function [J,detJ,invJ] = getJacobian(nodes, xi, eta)
N_der = [eta-1,xi-1;
         1-eta,-xi-1;
         1+eta,1+xi;
         -1-eta,1-xi]/4;
J = nodes'*N_der;
detJ = det(J);
invJ = inv(J);
end

