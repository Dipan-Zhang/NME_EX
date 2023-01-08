
clear


%% Define system dynamics
mis_match = 1;
A = [ -1.2822,0,0.98,0; 0,0,1,0;-5.4293,0,-1.8366,0;-128.2*mis_match,128*mis_match,0,0];

B = [-0.3;0;-17;0];

C = [0,1,0,0;0,0,0,1;-128.2*mis_match,128.2*mis_match,0,0];

D = [0;0;0];


%% Define control parameters
Ts = 0.5; % Sampling interval

T_end = 20; % Simulation time

n_steps = round(T_end/Ts); % Number of steps

H_p = 3; % Prediction horizon

H_u = 3; % Control horizon


%% Define MPC 

% Generate system model
sys = ss(A,B,C,D); % Continous state-space system dynamics 

model = c2d(sys,Ts); % Transfer to discrete state-space model

mpcobj = mpc(model,Ts,H_p,H_u); % Create MPC object 
% input : model,sampling interval, prediction horizon, control hor

%Define control input constraint
u_min = -0.262; % Elevator angle constraint
u_max = 0.262;
ud_min = -0.524 * Ts; % Elevator slew rate constraint
ud_max = 0.524 * Ts; % Need to be aline with the sampling time since this constraint is for each step


mpcobj.MV = struct('Min',u_min,'Max',u_max,'RateMin',ud_min,'RateMax',ud_max); 

% Hard constraint due to equipment design
mpcobj.MV.MinECR = 0;
mpcobj.MV.MaxECR = 0;
mpcobj.MV.RateMinECR = 0;
mpcobj.MV.RateMinECR = 0;

% Define output variable constraint
pitch_min = -0.349; % Pitch angle constraint
pitch_max = 0.349;

%define altitude rate constraint
ar_max = 30;
ar_min = -30;

mpcobj.OV = struct('Min',{pitch_min,-Inf,ar_min},'Max',{pitch_max,Inf,ar_max}); 

mpcobj.OutputVariables(1).MinECR = 0; % hard constraint
mpcobj.OutputVariables(1).MaxECR = 0;
mpcobj.OutputVariables(3).MinECR = 0.5; % hard constraint
mpcobj.OutputVariables(3).MaxECR = 0.5;

%define turbance ???
% mod = tf(1000,[1,0]);
% outdist = [0,0,0;0,0,0;0,0 mod];
% setoutdist(mpcobj,'model',outdist);
% 
% %output disturbance
% t_dstart = 5/Ts +1;
% t_dend = (5+5)/Ts;
% d = zeros(n_steps,1);
% 
% d_magnitute = 50;
% d(t_dstart:t_dend) = ones(t_dend - t_dstart +1 , 1) *d_magnitute;
% 
% d = [zeros(n_steps,1),zeros(n_steps,1),d];
%mpcobj.DisturbanceVariables(1).Name



% Define weights in cost function
Q = repmat([1,1,1],H_p,1); % Matrix Q           %%%%%%%%%%%%%%%%% change here %%%%%%%%%%%%%%%%%% 111->113
R = ones(H_u,1); % Matrix R

mpcobj.Weights.OV = Q; 
mpcobj.Weights.MV = 0;
mpcobj.Weights.MVRate = R;

% Reference signal
desired_altitude = 400; % Desired altitude       %%%%%%%%%%%%%%%% change here %%%%%%%%%%%%%%%%%%% 40->50->100->400

r = [zeros(n_steps,1), ones(n_steps,1)*desired_altitude, zeros(n_steps,1)];
%ref trajectory

[y,t,u] = sim(mpcobj,n_steps,r);


%% Plot Results
pitch_angle_deg = y(:,1)/3.14*180; % Transfer to degree
altitude = y(:,2);
altitude_rate = y(:,3);

elevator_angle = u/3.14*180; % Transfer to degree

figure
set(gcf,'color','w');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.02, 0.04, 0.90, 0.90]);
% Pitch angle y1
subplot(2,2,1)

plot(t,pitch_angle_deg,t,ones(length(pitch_angle_deg),1)*pitch_max/3.14*180,'linewidth',3);
%ylim([-5,22])
grid on
title('Pitch angle y_1 and constraint')
xlabel('Time (seconds)')
ylabel('Pitch (deg)')
set(gca,'fontsize',20,'fontweight','bold')

% Altitude y2
subplot(2,2,2)

plot(t,altitude,t,ones(length(altitude),1)*desired_altitude,'linewidth',3);
%ylim([0,45])
grid on
title('Altitude y_2 and set-point')
xlabel('Time (seconds)')
ylabel('Altitude (m)')
set(gca,'fontsize',20,'fontweight','bold')


% Altitude rate y2
subplot(2,2,3)

plot(t,altitude_rate,'linewidth',3);
%ylim([-5,28])
grid on
title('Altitude rate y_3')
xlabel('Time (seconds)')
ylabel('Altitude rate (m/sec)')
set(gca,'fontsize',20,'fontweight','bold')


% Elevator angle u
subplot(2,2,4)

stairs(t,elevator_angle,'linewidth',3)
hold on
plot(t,ones(length(elevator_angle),1)*u_min/3.14*180,'linewidth',3);
plot(t,ones(length(elevator_angle),1)*u_max/3.14*180,'linewidth',3);
hold off
%ylim([-18,18])
grid on

title('Elevator angle u and constraint')
xlabel('Time (seconds)')
ylabel('Elevator angle (deg)')

set(gca,'fontsize',20,'fontweight','bold')