% chapter 2. Linear Equations
% Gaussian Elimination : Ax=b일 때 x 구하기
A = [1 -2 3;2 -3 4;3 -4 5];
b = [4 5 7]';
A\b;

B = [1 5 -1; 3 5 2;1 5 3];
B\b;

% Truss 구조 힘 배분 문제
load Truss;
format shortg;
rhs = zeros(10,1);
rhs(6) = 1500;
truss\rhs;

% 전기회로 문제
A = [1 -1 1;4 2 0;0 2 5];
A\[0 -1 2]';

% 2.11
A = [1 3 8 0;-1 -12 3 1;15 3 5 6;55 2 35 5];
b = [1 0 2 3]';
A\b;

% 2.12
H = hilb(20);
b1 = ones(20,1);
b2 = repmat(0.99, [20 1]);
H\b1;
H\b2;

% 2.13 : Tridiagonal matrix -> 'Trifact'
a = ones(4,1);
b = 5*ones(5,1);
c = -ones(4,1);
T = diag(a,-1) + diag(b) + diag(c,1);

% 2.14
% 'positive definite' : (1xn)인 벡터 x에 대해 x'*A*x > 0을 만족하는 symmetric matrix 
% gallery 함수로 positive definite 행렬 만들고, chol() 함수로 R 찾기
% positive definite인 행렬은 upper triangular matrix인 R에 대해 A = R^T*R로 표현 가능
A = gallery('moler', 5);
R = chol(A);
A == R'*R;

% 2.15
% electrical circuit에서 loop에서 식 풀어서 정리해야함
R = [1 -1 -1;2 4 0;0 4 1];
V = [0 5 3]';
R\V