%Aufgabe 1
a = 0;
b = 4;
%Mittelpunktregel
%fx(0.5(a+b_))
I_M = (b-a)*fx((a+b)/2)
%Trapezregel
%0.5*(fx(a)+fx(b))
I_T = (b-a)*(fx(a)+fx(b))/2


%integral = 
%GQ-11
I_G1 = gw(1)'*fx(gx(1)*(b-a)/2 + (a+b)/2)*(b-a)/2

%GQ-2
I_G2 = gw(2)*(fx(gx(2)*(b-a)/2 + (a+b)/2)*(b-a)/2)'

%GQ-3
I_G3 = gw(3)*(fx(gx(3)*(b-a)/2 + (a+b)/2)*(b-a)/2)'