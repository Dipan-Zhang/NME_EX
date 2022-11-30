clc;
clear;
res = zeros(25,1);
x_cord = zeros(25,1);
delta = 1e-20;
for i=1:25
    P1 = [0,1]';
    P2 = [delta,1+delta]';
    x_cord(i,:) = delta;
    res(i,:) = lineintersection(P1,P2);
    delta = delta*10;
end

res_abs = abs(res - 1);


plot(log(x_cord),log(res_abs));
