A = 3*eye(4);
v = [1,2,3,4]';
a = v'*v;

C = A*v*v';

%syms x1 x2 x3 x4;
%x = [x1;x2;x3;x4];
%eqn = (C-A)*x -a*v == 0;

%C = [C(:,1),v,C(:,3:4)]
b = C(3,:);
c = [10:0.5:100]
f = c.*(c+5)+ 1./c + 2.^c

%linsolve(eqn,x)
syms x
x = linsolve(C-A,a*v)