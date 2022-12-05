%% Aufgabe 1
theta = 1;
timestep = 0.2;

k = 4/timestep + 2;
fai_VE = zeros(k,1);

t_n = 0;
fai_n = 0;
n = 1;

%% vorwaerts Euler
for t =0:timestep:4
    fai_n_plus_1 = fai_n + theta*timestep*f1(t_n,fai_n);
    fai_VE(n+1) = fai_n_plus_1;
    t_n = t + timestep;
    fai_n = fai_n_plus_1;
    n = n + 1;
end


t =0:timestep:4+timestep;
plot(t,fai_VE,'b');
hold on;
plot(t,fai_std(t),'k');



%% Ruckwarts Euler und 
fai_RE = zeros(k,1);
M = 1;
B = [-6,-6];
theta = 1;

n = 1;
sol = 0;
for t =0:timestep:4
    C = [ (t+timestep)^2*exp(-5*(t+timestep)), t^2*exp(-5*t)];
    [LHS_RE,RHS_RE] = OST(theta,timestep,M,B,C,sol);
    sol = LHS_RE\RHS_RE;
    fai_RE(n+1) = sol;
    n = n + 1;
end
t =0:timestep:4+timestep;
plot(t,fai_RE,'y');


%% Trapezregel
fai_TR = zeros(k,1);
theta = 0.5;
t_n = 0;
fai_n = 0;
n = 1;
sol = 0;
for t =0:timestep:4
    C = [ (t+timestep)^2*exp(-5*(t+timestep)), t^2*exp(-5*t)];
    [LHS_RE,RHS_RE] = OST(theta,timestep,M,B,C,sol);
    sol = LHS_RE\RHS_RE;
    fai_TR(n+1) = sol;
    n = n + 1;
end
t =0:timestep:4+timestep;
plot(t,fai_TR,'r');
legend('VE','Exact','RE','TR');


