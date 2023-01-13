% chapter 1.Matrices
% example 1.5 Matrix operation
A = [1 5 1;2 -1 6;1 0 3];
B = [2 3 0;3 -1 7;4 8 9];
5*A -10*B + 3*A*B
trace(A+B)
7*trace(A+B)
trace(A*B)
A.*B

% example 1.8 Linear Transformation(Rotation+이동)
% (2,11)->(0,0) , rotate -30, (0,0)->(2,11)
T1 = [1 0 -2;0 1 -11;0 0 1];
R = [cos(pi/6) -sin(pi/6) 0;sin(pi/6) cos(pi/6) 0; 0 0 1];
T2 = [1 0 2;0 1 11;0 0 1];

T = T2*R*T1;
% 변환의 대상 : 직선(y=5x+1)을 변환하려면 직선 상의 두 점을 변환하면 된다.
p1 = [0 1 1]';
p2 = [2 11 1]';

p1_t = T*p1;
p2_t = T*p2;

% y = (p2_t(2,1)-p1_t(2,1))/(p2_t(1,1)-p1_t(1,1))*(x-p1_t(1,1)) + p1_t(2,1)
% 결과 : y = -2.9561x + 16.9121

% example 1.9 Power of Matrix
A = [1 1;1 0];
A^8;

% example 1.13 Nonsingular & Inverse
format rational;
A = [1 3 -1;4 1 6;0 2 3]
A_inv = inv(A)
B = [1 4 0;3 5 1;2 -7 8]
B_inv = inv(B)
inv(A*B) == B_inv * A_inv % 이거 왜?? : 같이 생각해보자

% Matrix Transpose and Symmetric matrice
% example 1.15 
A = [1 8 -1;3 -9 15;-1 5 3];
A_TA = A' * A;
A_TA - A_TA'

% MATLAB Problems
% 1.26
A = [1 4 1;1 3 2;-1 2 7];
B = [1 0 1;2 5 12;-9 1 1];

isequal(inv(A*B), inv(B) * inv(A)) % 연산 과정에서 오차가 생기나 봄
isequal(round(inv(A*B),1), round(inv(B) * inv(A),1)) % 이렇게 소수점 1번째까
%지로 자르면 같다고 뜸

%1.27
A = [1 3 -1 -9;0 3 0 1;12 8 -11 0;2 1 5 3];
inv(A);

%1.28 Hilbert matrix
H = hilb(6);
inv(H);
format shortg;
H = hilb(6);
inv(H);

%1.29 
t = tr(A);
t2 = tr(H);
trace(H);

% 1.30
A = [1 7 0 0 0;4 5 8 0 0;0 6 1 1 0;0 0 7 3 -9;
    0 0 0 1 2];
x1 = [0 1 -1 3 2]';
x2 = [6 0 1 3 0]';
y1 = triprod(A, x1);
y2 = triprod(A, x2);

y1 == A*x1
y2 == A*x2


