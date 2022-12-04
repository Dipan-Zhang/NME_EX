%Aufgabe2
%2D Gauß-Quadratur

clear;
clc;
%test getxpos
nodes = [2,1;4,1;4,3;2,2];
xi = 0.577;
eta = -0.577;
getxPos(nodes,xi,eta)
[J,detJ,invJ] = getJacobian(nodes,xi,eta)

z = [0,1,3,1];

%% Intergral

Im_12_G1 = gw2dref(1)*detJ