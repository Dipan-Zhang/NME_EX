%basic operation of matrix and vector in matlab

% interesting: linsolve() + way to write test

A = 3*eye(4);
v = [1,2,3,4]';
B = v*v';
a = v'*v;

C = A*B;
res_eig = eig(C);
%syms x1 x2 x3 x4;
%x = [x1;x2;x3;x4];
%eqn = (C-A)*x -a*v == 0;

% linear solver two ways: using linsolve or \

%linsolve(eqn,x)
% syms x
% x = linsolve(C-A,a*v);

x = a*v\(C-A);



%C = [C(:,1),v,C(:,3:4)]
b = C(3,:);
c = [10:0.5:100];
f = c.*(c+5)+ 1./c + 2.^c;



%% test1 Eigenvalue
ext_eig = [-0.000000000000002; 0.0; 0.000000000000007; 90.0];
for iter = 1: size(res_eig,1)
    assert((res_eig(iter) - ext_eig(iter))<1e-12)
end

%% test2 Gleichungslosung
ext_res = [0.344827586206896; 0.689655172413793; 1.034482758620690; 1.379310344827587];
for iter = 1: size(x,1)
    assert((x(iter) - ext_res(iter))<1e-12)
end
