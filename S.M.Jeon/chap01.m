%% Matrix operation
A = [1 5 1; 2 -1 6; 1 0 3];
B = [2 3 0; 3 -1 7; 4 8 9];
5*A - 10*B + 3*A*B; % because A*B is a 3*3 matrix, we can calculate
trace(A+B); % sum of the diagnal
A.*B; % dot product

%% Rotation
y = 5*x + 1;
P = [x; y];
R = ['X'; 'Y']; %rotate y=5*x+1 line degree pi/6 counterclockwise
R = [cos(pi/6) -sin(pi/6); sin(pi/6) -cos(pi/6)] * P; % cos(a+theta) = xcos(theta)-xsin(theta), sin(a+theta) = ysin(theta)-ycos(theta)
% in three dimension, 
% if the x_rotate = x , y_rotate= ycos-ysin, z_rotate= zsin-zcos
% it means rotation about the x-axis

%% Reposition
T = [1 0 tx;0 1 ty; 0 0 1]; % reposition matrix (x,y)-> x+tx, y+ty)

%% Identity matrix(inverse)
format rational;
D = [1 3 1; 4 1 6; 0 2 3];
inv(D); %meaning that inv(D)*D = I(identity matrix)
I = [1 0 0 ; 0 1 0; 0 0 1];%3*3 identity matrix

%% The matrix transpose and symmetric matrices
E = [1 9 0; 3 7 15; 4 8 1; -7 12 3];
E_trans = [1 3 4 -7; 9 7 8 12; 0 15 1 3];% interchange rows and columns
% E trans = E'

%% Matlab problems
% 1.26
format rational
A = [1 4 1; 1 3 2; -1 2 7];
B = [1 0 1; 2 5 12; -9 1 1];
inv(A*B);
inv(B)*inv(A); % same as above

% 1.28
format shortg %floating point format with 5 digits
H = hilb(6); % hillbert matrix
inv(sym(H)); % the exact inverse matrix of H

% 1.29
tr(hilb(6)); % check function script

if trace(H)-tr(H) == 0
    disp('True')
end % check the function works fine

M = [1 7 0 0 0; 4 5 8 0 0; 0 6 1 1 0; 0 0 7 3 -9; 0 0 0 1 2];
x = [0 1 -1 3 2]';
triprod(M,x); % check function script

% check the function works fine
if triprod(M,x)-M*x == 0
    disp('Fine')
end



