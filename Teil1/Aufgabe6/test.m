%test example 
theta = 0.5;
timestep = 0.2;
M = 1.1;
B = [1.4, 1.5];
C = [1.7, 1.8];
sol = 2.0;

%% Test : OST
result = OST(theta,timestep,M,B,C,sol);
diff = result - [0.96, 2.85];
for n = 1:2
    assert((diff(n) < 1e-12));
end

%% Test: AB2
timestep = 0.2;
M = 1.1;
B = [1.5, 1.6];
C = [1.8, 1.9];
sol = [2.0, 2.1];
result = AB2(timestep,M,B,C,sol);
diff = result - [1.1, 3.114];
for n = 1:2
    assert((diff(n) < 1e-12));
end

%% Test: AM3

timestep = 0.2;
M = 1.1;
B = [1.4, 1.5, 1.6];
C = [1.7, 1.8, 1.9];
sol = [2.0, 2.1];
result = AM3(timestep,M,B,C,sol);
diff = result - [0.983333333333333, 2.894];
for n = 1:2
    assert((diff(n) < 1e-12));
end



%% Test: BDF2

timestep = 0.2;
M = 1.1;
B = 1.4;
C = 1.7;
sol = [2.0, 2.1];
result = BDF2(timestep,M,B,C,sol);
diff = result - [1.37, 3.585];
for n = 1:2
    assert((diff(n) < 1e-12));
end