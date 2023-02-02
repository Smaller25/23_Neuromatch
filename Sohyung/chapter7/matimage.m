function [max_x, min_x] = matimage(A)
% 변형 버전: max_x, min_x 출력하고 그리기+max_Ax, min_Ax도 함께 그리기
    % build the unit circle
    t=0:0.01:2*pi;
    x=cos(t)';y=sin(t)';
    npts = length(t);
    Ax = zeros(npts,1);
    Ay = zeros(npts,1);
    max_x = [0;0];
    min_x = [10;10];
    %Image of the unit circle under A
    for i = 1:npts
        v=[x(i);y(i)];
        w=A*v;
        Ax(i)=w(1);
        Ay(i)=w(2);
        len = norm(w,2);
        if len <= norm(A*min_x,2)
            min_x = v;
            min_Ax = w;
        end
        if len >= norm(A*max_x,2)
            max_x = v;
            max_Ax = w;
        end
    end
    % Plot of the circle and its image
    plot(x,y,Ax,Ay,'.','MarkerSize',10,'LineWidth',3);
    hold on; grid on; axis equal;
    quiver(0,0,max_x(1),max_x(2),'r');
    quiver(0,0,max_Ax(1),max_Ax(2),'r');
    quiver(0,0,min_x(1),min_x(2), 'b');
    quiver(0,0,min_Ax(1),min_Ax(2), 'b');
    title('Action of a linear transformation on the unit circle');
    xlabel('x'); ylabel('y');
    hold off;
end