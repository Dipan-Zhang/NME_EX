%Aufgabe2
%2D Gauß-Quadratur

clear;
clc;
%test getxpos
nodes = [2,1;4,1;4,3;2,2];
xi = 0.577;
eta = -0.577;
getxPos(nodes,xi,eta)
[J,detJ,invJ] = getJacobian(nodes,xi,eta);

z = [0,1,3,1];

%% Intergral
n = 2;
x = gx2dref(n);
w = gw2dref(n);
Im_12 = 0;
for i = 1:size(x,1)
    Im_12 = Im_12 + w(i)*N1N2detJ(nodes,x(i,1),x(i,2));
end

