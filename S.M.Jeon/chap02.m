%% Gaussian elimination(Upper-triangular form)
% perform%ing row operations 
% untill the coefficient matrix become upper-triagular form
% for example,
syms A [3 4]; % let this one is a coefficient matrix

nrows = 3;
ncols = 4;
syms B [nrows,ncols];
for c = 1:ncols
    for r = 1:nrows
        if r-c>= 0
            B(r,c) = 0;
        end
    end
end
% B is upper-trianular form

%% Systematic solution of linear systems
% If B(3,4) is 0,
B(3,4) = 0;
% it is said to be inconsistent
% let b is colum vector and B*x=b
b = [1 4 5]';
sol_type(b); % check the function sol_type()

%% Computing the inverse
%The inverse of matrix c is a solution of AX= Identity matrix
%Think the identity matrix as a sum of  column vetor 
%ex)
v_1 = [1 0 0]';
v_2 = [0 1 0]';
v_3 = [0 0 1]';
I = [v_1 v_2 v_3];

%% Homogeneous systems
% Let C is a coefficient matrix and make linear equation C*x = c
% if c is a column vector consist of zeros, that is homogeneous system

C = [1 2 1;5 2 7;2 0 3];
c = zeros(3,1);
x = C\c;

%% Matlab problems
% 2.11
D = [1 3 8 0; -1 -12 3 1; 15 3 5 6; 55 2 35 5];
d = [1 0 2 3];
D\d;

% 2.12
H = hilb(20);
h_1 = ones(20,1);
H\h_1;

h_2 = 0.99*ones(20,1);
H\h_2

% 2.13 matrix factorization
% nonsingular tridiagonal matrix can be factored 
% into the product of a lower bidiagonal and upper bidiagonal 
a = ones(4,1);
b = 5*ones(5,1);
c = -ones(4,1);
T = diag(a,-1) + diag(b) + diag(c,1); %diag = diagonal((-1,1) (lower, upper))

% 2.14
% a
% syms X [2 1], use the posdef function;
% s = X'*A*X; % if A is positive define matrix and X is not [0;0], s is positive
% check it
X = [0;0];
A = [2 1; 1 2];% this matrix if positive define
posdef(A,X);
% b
R = [sqrt(2) sqrt(1/2); 0 sqrt(3/2)];% R'*R = A
% c
D = gallery('moler',5); % generate 5*5 positive define matrix
chol(D); % D is factored into R'*R