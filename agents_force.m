function F_tot=agents_force(A,alpha)
    % DISCRIPTION:
    % This function calculates the force caused on the agent in coloumn alpha
    % of matrix A. 
    % 
    % DETAILED DESCRIPTION:
    % The calculation is based on the social force model. The
    % potential function used was V_alphabeta=v0_alphabeta*exp(-b/sigma).
    % The parameter b calculates the smaller semi axis of the ellipse which
    % is centered on other agents (beta agents). The longer axis of this ellipse
    % is parallel with the directio vector of other agents. This means that 
    % the exerted force from other agents depends which direction they are
    % facing. For more information see "Social forces model for pedestrian
    % dynamics"  III. FORMULATION OF SOCIAL FORCE MODEL  Dirk Helbing et
    % al
    % 
    %
    % PARAMETERS:
    % A                     = 2 by agent_number matrix, Agentmatrix
    % alpha                 = Agent ID for which Force is to be calculated
    % b                     = smaller semi axis of ellipse
    % F                     = 2 by 1 vector, force caused by other Agents
    % agent_others          = 2 by agent_number-1 matrix containing other agent information
    % agent_alpha           = 2 by 1 vector containing agent alpha information
    % r_alphabeta_matrix    = 2 by agent_number-1 matrix with all distances between alpha/others
    % v_beta_matrix         = 2 by agent_number-1 matrix  all velocities of other agents
    % e_beta_matrix         = 2 by agent_number-1 matrix, direction vector
    % F_abs                 = 1 by agent_number-1 vector, absolute Force
    %
    % Structure of Matrix A:
    %
    %                 | Agent 1  | Agent 2 | Agent 3
    %-----------------------------------------------
    % position x      |
    % position y      |
    % speed    x      |
    % speed    y      |
    % desired speed v0|
    % type            |

    
    global dt v0_alphabeta sigma tau_alpha X_goals; % global constants defined in parameters.m
        
    agent_number=size(A,2);
    
    % seperate agent alpha from other agents
    agent_others=[A(:,1:alpha-1) A(:,alpha+1:end)];
    agent_alpha=A(:,alpha);
    
    % calculate all r_alphabeta vectors and store in matrix
    % Doesn't alphabeta mean: beta-alpha? 
    r_alphabeta_matrix=(agent_alpha(1:2,:)*ones(1,agent_number-1)-agent_others(1:2,:));
    rausschmeissen = sqrt(sum(r_alphabeta_matrix.^2))>15;
    agent_others(:,rausschmeissen) = [];
    agent_number=size(agent_others,2)+1;
    % get all v_betas
    v_beta_matrix=agent_others(3:4,:);
    
    % calculate Force Unit vector
    % Somethings' odd: The unity vectors are not so much unity
    % Solved: sqrt was missing...
    e_beta_matrix=r_alphabeta_matrix./(ones(2,1)*sqrt(sum(r_alphabeta_matrix.^2)));
    
     
    % calculate smaller semi axis of ellipse 
%     b=(1/2)*sqrt(...  
%         (...
%         sqrt(sum(r_alphabeta_matrix.^2))+...
%         sqrt(sum((r_alphabeta_matrix-v_beta_matrix*deltat).^2))...
%         ).^2-...
%         (sqrt(sum(v_beta_matrix.^2))*deltat).^2);
%     
    %b=sqrt(sum(r_alphabeta_matrix.^2)); %circular potential..
    % absolute value of forces
    
    %F_abs=v0_alphabeta*(-1/sigma).*exp(-b/sigma);
    
%     F_abs=v0_alphabeta*...
%     [ (((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2))*((2*s - 2*x)/(2*((r - y).^2 + (s - x).^2).^(1/2)) - x/(x.^2 + y.^2).^(1/2)))/(sigma*exp((((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2)).^2 - s.^2 - r.^2).^(1/2)/sigma)*(((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2)).^2 - s.^2 - r.^2).^(1/2))
%     (((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2))*((2*r - 2*y)/(2*((r - y).^2 + (s - x).^2).^(1/2)) - y/(x.^2 + y.^2).^(1/2)))/(sigma*exp((((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2)).^2 - s.^2 - r.^2).^(1/2)/sigma)*(((x.^2 + y.^2).^(1/2) + ((r - y).^2 + (s - x).^2).^(1/2)).^2 - s.^2 - r.^2)^(1/2))]
    F_tot = [0;0];
    F_tot = 1/tau_alpha*(agent_alpha(3:4)/norm(agent_alpha(3:4),2)*agent_alpha(5)...
        -agent_alpha(3:4));
    for i=1:agent_number-1
        s = v_beta_matrix(1,i)*3; r = v_beta_matrix(2,i)*3;
        x = r_alphabeta_matrix(1,i); y = r_alphabeta_matrix(2,i);
        F_tot= F_tot...
            -[ (((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))*((2*s - 2*x)/(2*((r - y)^2 + (s - x)^2)^(1/2)) - x/(x^2 + y^2)^(1/2)))/(sigma*exp((((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))^2 - s^2 - r^2)^(1/2)/sigma)*(((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))^2 - s^2 - r^2)^(1/2));...
            (((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))*((2*r - 2*y)/(2*((r - y)^2 + (s - x)^2)^(1/2)) - y/(x^2 + y^2)^(1/2)))/(sigma*exp((((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))^2 - s^2 - r^2)^(1/2)/sigma)*(((x^2 + y^2)^(1/2) + ((r - y)^2 + (s - x)^2)^(1/2))^2 - s^2 - r^2)^(1/2))]...
            .*e_beta_matrix(:,i)*v0_alphabeta;
    end
        
    
    % vector value of forces
    %F=e_beta_matrix.*(ones(2,1)*F_abs);
    
    % sum / superposition over all forces -> one vector force
    %F_tot=sum(F,2);
    F_tot = [ F_tot(2); F_tot(1) ]; %transponieren
    
end
