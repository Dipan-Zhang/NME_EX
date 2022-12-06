clc;
clear;
stepsize = sqrt(10);
steps = 51;

res = zeros(steps,1);
x_cord = zeros(steps,1);
delta = 1e-20;
x_cord(1) = delta;
for i=1:steps-1
    P1 = [0,1]';
    P2 = [delta,1+delta]';
    res(i,:) = lineintersection(P1,P2);
    delta = delta*stepsize;
    x_cord(i+1,:) = delta;
end

res_abs = abs(res - 1);


loglog(x_cord,res_abs);
xlabel('delta')
ylabel('abs error');
