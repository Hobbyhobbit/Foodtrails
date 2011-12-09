%% Primitive Zeichenfunktion
%function draw_map_agents(my_figure,A,zkarte,zpfeile,zpunkte,psize)

% figure(my_figure);
clf()

global map_pretty fields_x fields_y sigma ddirect_x ddirect_y;
% 
% 
% 
    imagesc( map_pretty );        %Hintergrundbild laden
    colormap('bone');
    
    hold on;
    %axis equal;
    
    % draw vector field
    draw_field = 1;
%     quiver(ddirect_x(:,:,draw_field), ...
%                                ddirect_y(:,:,draw_field),'Color',[.5,.5,.5]);
    quiver(fields_x(:,:,draw_field), ...
                               fields_y(:,:,draw_field),'Color',[.5,.5,.5]);
    
    %quiver(A(1,:),A(2,:),A(3,:),A(4,:),0,'g');    %Pfeile zeichnen
    %quiver(A(1,:),A(2,:),agents_f(1,:)/1e2,agents_f(2,:)/1e2,0,'r');
    %quiver(A(1,:),A(2,:),agents_p(1,:),agents_p(2,:));
%     plot(A(1,:),A(2,:),'o','MarkerSize',sigma,'MarkerFaceColor','y'); %Punkte zeichnen
%     
   plot(A(1,A(6,:)==1),A(2,A(6,:)==1),'o','MarkerSize',sigma,'MarkerEdgeColor','r','MarkerFaceColor','r'); %Punkte zeichnen
   plot(A(1,A(6,:)~=1),A(2,A(6,:)~=1),'o','MarkerSize',sigma,'MarkerFaceColor','b'); %Punkte zeichnen
%     plot(A(1,A(6,:)==3),A(2,A(6,:)==3),'o','MarkerSize',sigma,'MarkerFaceColor','b'); %Punkte zeichnen
%    
