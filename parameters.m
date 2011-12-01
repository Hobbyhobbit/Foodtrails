%%%%%%%%%%%%%%%%%%%%
% GLOBAL PARAMETERS
%%%%%%%%%%%%%%%%%%%%

global ...
    dt ... 
    meter...
    hue_goal ...
    hue_init ...
    map_file ...
    R ... 
    v0_alphabeta ...
    sigma ...
    agent_number...
    v0_mean...
    tau_alpha...
    U_alphaB_0...
    sqrt_theta;

% General
dt = .1;
agent_number = 100;

% Map
meter = 40; % px/m, according to:
map_file = 'testmap.png'; % Bitmap file for goals and walls

% Map colors
hue_goal = [0.3 0.1]; % Value / Tolerance
hue_init = [0.0 0.1]; % Value / Tolerance


% Boundary potential
R = 0.2 * meter; % m, according to paper
U_alphaB_0 = 10 * meter^2; % m^2/s^2, max. boundary potatial

% Agents
v0_alphabeta = 2.1*meter^2;
sigma = 0.3*meter; % m 
v0_mean = 1.34 * meter; % this is the mean of the desired speed of an agent
              % m/s equals v_alpha_0 in formula (2)
tau_alpha = 0.5; % s, "relaxation time"
sqrt_theta = 0.26*meter; % m/s standard deviation of gaussian distributed v0_mean

