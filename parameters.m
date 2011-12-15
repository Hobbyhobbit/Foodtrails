%%%%%%%%%%%%%%%%%%%%
% GLOBAL PARAMETERS
%%%%%%%%%%%%%%%%%%%%

global ...
    dt ... 
    meter...
    hue_goal ...
    hue_init ...
    hue_counter ...
    wall_th...
    map_file ...
    R ... 
    v0_alphabeta ...
    sigma ...
    agent_number...
    v0_mean...
    tau_alpha...
    U_alphaB_0...
    sqrt_theta...
    noplot...
    video_on...
    log_on...
    duration...
    A1...
    A2...
    B1...
    B2...
    sight;

% General

agent_number = 300;
dt = .1;
noplot = false;
video_on = false;
log_on = true;
duration = 5000; % frames

% Map
meter = 10; % px/m, according to:
map_file = 'grundrissplan2.png'; % Bitmap file for goals and walls

% Map colors  % Value / Tolerance
hue_goal = [0.3 0.1]; % green
hue_init = [0.0 0.1]; % red
hue_counter = [0.1 0.1]; % yellow

wall_th = 0.2; % less than 20% grey is ignored and counts as free space

% Boundary potential
R = 0.05 * meter; % m, according to paper
U_alphaB_0 = 5 * meter^2; % m^2/s^2, max. boundary potential

% Agents
v0_alphabeta = 2.1*meter^2 * 10; % m^2/s^2, max. agent potential
sigma = 0.3*meter; % m 
v0_mean = 1.34 * meter; % this is the mean of the desired speed of an agent
              % m/s equals v_alpha_0 in formula (2)
tau_alpha = .3; % s, "relaxation time"
sqrt_theta = 0.26*meter; % m/s standard deviation of gaussian distributed v0_mean

A1 = 0*meter;
B1 = 0.2*meter;
A2 = 3*meter; % m/s^2
B2 = 0.2*meter; % m

sight = 1*meter;
