clc;
clear;
x_node = [0,1,2,3,4]';
f_node = [0,0.03125,0.131687242798,0.237304687500,0.327680000000]';

res1 = LagrangePolynom(0.6,1,x_node,f_node)
res2 = LagrangeDerivPolynom(0.6,1,x_node,f_node)


res3 = LagrangePolynom(0.6,4,x_node,f_node)
res4 = LagrangeDerivPolynom(0.6,4,x_node,f_node)






x_80 = 0:0.05:4;
y_80 = (x_80./(1+x_80)).^5;
x_80 = x_80';
y_80 = y_80';
res5 = LagrangePolynom(0.6,80,x_80,y_80)
res6 = LagrangeDerivPolynom(0.6,80,x_80,y_80)
