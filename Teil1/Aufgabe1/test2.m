%test example 
num1 = 0;
num2 = 1;
num3 = 2;
num4 = 3;
num5 = 4;
num6 = 5;

%% Test : accuracy1
result = facultaet(num1);
assert((result-1)<1e-12);

%% Test : accuracy2
result = facultaet(num2);
assert((result-1)<1e-12);

%% Test : accuracy3
result = facultaet(num3);
assert((result-2)<1e-12);

%% Test : accuracy4
result = facultaet(num4);
assert((result-6)<1e-12);

%% Test : accuracy5
result = facultaet(num5);
assert((result-24)<1e-12);

%% Test : accuracy6
result = facultaet(num6);
assert((result-120)<1e-12);