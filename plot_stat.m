% Structure of A_stat:

%              Agent 1 | Agent 2 | ...
%             _________|_________|____
% 1 Velocity |\        
% 2 Crowd    |  \
% 3 Goal     |    \
%            |      \
%            |        \ 3rd Dimension: frames

loglen = nnz( sum( sum(A_stat, 2), 1) );

global fetchtimes;

% to improve: nur agenten, die den roten bereich verlassen haben, beachten!
%% speed graph

speeds = permute( A_stat(1, :, 1:loglen), [3,2,1] );

hold on;

plot( speeds, 'k' );
s_avg = plot( sum( speeds, 2)/size(A_stat, 2) , 'r' , 'LineWidth', 2);
legend(s_avg, 'Average speed');

set(gca,'FontSize',16)
xlabel('time [frames]');
ylabel('speed [px/frame]');


%% density graph

dens = permute( A_stat(2, :, 1:loglen), [3,2,1] );

hold on;

plot( dens, 'k' );
d_avg = plot( sum( dens, 2)/size(A_stat, 2) , 'b' , 'LineWidth', 2);
legend(d_avg, 'Average density');

set(gca,'FontSize',16)
xlabel('time [frames]');
ylabel('density [neighbours within 1m]');


%% fetching time graph

plot(fetchtimes(2,:), fetchtimes(2,:)-fetchtimes(1,:), 'ok');
