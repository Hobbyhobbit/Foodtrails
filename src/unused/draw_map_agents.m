%% Primitive Zeichenfunktion
%function draw_map_agents(my_figure,A,zkarte,zpfeile,zpunkte,psize)

% figure(my_figure);



global map_pretty X_fm map_x map_y e_alpha_x e_alpha_y fields_x fields_y sigma ddirect_x ddirect_y;
% 
% 

clf()

subplot(1,2,2);
image( X_fm(:,:,1) , 'CDataMapping','scaled' ); axis image;
hold on;

space_x = floor(linspace(1,map_x, 50));
space_y = floor(linspace(1,map_y, 50));
quiver(space_y, space_x, ...
       e_alpha_x(space_x, space_y), e_alpha_y(space_x, space_y), 0.5);

subplot(1,2,1);

% 
    imagesc( map_pretty );        %Hintergrundbild laden
    colormap('bone');
    
    hold on;
    axis image;
    
    % draw vector field
    draw_field = 1;
%     quiver(ddirect_x(:,:,draw_field), ...
%                                ddirect_y(:,:,draw_field),'Color',[.5,.5,.5]);
    %quiver(fields_x(:,:,draw_field), ...
    %                           fields_y(:,:,draw_field),'Color',[.5,.5,.5]);
    
    %quiver(A(1,:),A(2,:),A(3,:),A(4,:),0,'g');    %Pfeile zeichnen
    %quiver(A(1,:),A(2,:),agents_f(1,:)/1e2,agents_f(2,:)/1e2,0,'r');
    %quiver(A(1,:),A(2,:),agents_p(1,:),agents_p(2,:));
%     plot(A(1,:),A(2,:),'o','MarkerSize',sigma,'MarkerFaceColor','y'); %Punkte zeichnen
%     
   
plot(A(1,A(6,:)==1),A(2,A(6,:)==1),'o','MarkerSize',sigma,'MarkerEdgeColor','r','MarkerFaceColor','r'); %Punkte zeichnen
   plot(A(1,A(6,:)~=1),A(2,A(6,:)~=1),'o','MarkerSize',sigma,'MarkerFaceColor','b'); %Punkte zeichnen
   axis image;
   
   annotation(figure(1),'textbox',...
    [0 0 0.245428571428571 0.395238095238098],...
    'String', statistic ,...
    'FitBoxToText','off');
   
   
%     plot(A(1,A(6,:)==3),A(2,A(6,:)==3),'o','MarkerSize',sigma,'MarkerFaceColor','b'); %Punkte zeichnen
%    
