%%%%%%%%%%%%%%%%%%%%
% GLOBAL PARAMETERS
%%%%%%%%%%%%%%%%%%%%

global ...
    dt ... 
    meter...
    hue_goal ...
    hue_init ...
    hue_counter ...
    map_file ...
    R ... 
    v0_alphabeta ...
    sigma ...
    agent_number...
    v0_mean...
    tau_alpha...
    U_alphaB_0...
    sqrt_theta...
    video_on...
    A1...
    A2...
    B1...
    B2;

% General

agent_number = 200;
dt = .05;
video_on = false;

% Map
meter = 20; % px/m, according to:
map_file = 'testmap_counter.png'; % Bitmap file for goals and walls

% Map colors  % Value / Tolerance
hue_goal = [0.3 0.1]; % green
hue_init = [0.0 0.1]; % red
hue_counter = [0.1 0.1]; % yellow


% Boundary potential
R = 0.2 * meter; % m, according to paper
U_alphaB_0 = 10 * meter^2; % m^2/s^2, max. boundary potential

% Agents
v0_alphabeta = 2.1*meter^2 * 10; % m^2/s^2, max. agent potential
sigma = 0.3*meter; % m 
v0_mean = 1.34 * meter; % this is the mean of the desired speed of an agent
              % m/s equals v_alpha_0 in formula (2)
tau_alpha = .3; % s, "relaxation time"
sqrt_theta = 0.26*meter; % m/s standard deviation of gaussian distributed v0_mean

A1 = 0;
B1 = 1;
A2 = 3*meter; % m/s^2
B2 = 0.2*meter; % m
