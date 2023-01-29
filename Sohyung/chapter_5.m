%% chapter 5. Eigenvectors & Eigenvalues
%% Definition
% Av = rv (scala r), (A-rI)v = 0
% det(A-rI)=0 : characteristic polynomial of A =p(r):r에 대한 n차 다항식
%% Eigenvector, Eignevalue 구하기
% p(r)=0의 해 구하기>구한 ri (i=1,2,..n) 대입해서 (A-rI)구하기>solution이 되는 v 구하기
%% Property
% 1)(n,n) matrix가 singular하다 == eignvalue로 0을 가진다/포함한다
% 2)Together with 0, eigenvectors corresponding to r form a subspace: eigenspace (subspace의 조건:linear independent/+,-,scala 곱에 대해 닫혀있다/0벡터)
% 3)(n,n) det(A-rI) = (-1)^n*(r-r1)*...(r-rn) / det(A) = r1*r2*...rn
%% Diagonalization
% Def) Similar matrix: B = inv(X)*A*X로 표현 가능한 경우, A와B를 similar matrix라고 한다
%       - eignevalue 동일
% Def) Diagonalize : A에 대해서 inv(X)*A*X = D(대각행렬)인 경우
%       - A가 invertible하면, det(A)*det((inv(A)) = 1
%       - Eigenvector v1,v2는 서로 linearly independent하다(trivial인지 확인해서 가능)
% Method) A의 eigenvector(v1,v2..vn) 구하기> X=[v1,v2,...vn] > inv(X)*A*X=D, D는
% 대각에 r1,r2,...rn 있는 형태인 대각행렬리다. 
% Diagonalizable 판단하기)
% 1) p(r)=0의 해 중에 complex root 있으면 실수 공간 내에서는 안된다
% 2) 다중근이 있는 경우, 해당 근 ri가 제곱된 횟수를 multiplicity ki라고 했을때, ri에 대해 linearly
% independent한 ki개의 eigenvector가 없으면 안된다
%% Application
% 1) power of matrix : A^n 같은 경우/A=X*D*inv(X) -> A^n = X*D^n*inv(X)/ex)피보나치 행렬
% 2) Electrical Circuit : RL Circuit의 경우에 식 구하기, dx/dt 이용
% 3) Irreducible Matrix(기약 행렬) for ranking problem
%   - 전체 matrix를 4개의 블록으로 나눌 수 있을 때, reducible이라고 한다.
%   - ex1. Irreducible matrix) strongly connected diagraph(모든 그래프의 노드가 연결)
%   - ex2. Perron-Frobenius theorem의 nonnegative matrix에 대한 정의
%         : irreducible(eigenvector r has strictly positive entries +
%         largest eigenvalue of  A in absolute value) + nonnegative
%         entries(positive eignevalue)

% example 5.15 : Peron-Frobenius theorem 
% perron 함수 : unique eigenvector & corresponding largest eignevalue
T = [0 1 0 1 0;1 0 0 0 1;0 1 0 1 1;0 0 1 0 1;0 0 1 0 0];
[lambda r] = perron(T)

% example 5.16 : Ranking problem
S = [0 14 3 17 24 0 35 2;7 0 14 31 45 2 29 28;7 31 0 42 7 17 7 34;12 10 34 0 20 31 12 14;27 28 35 27 0 14 15 20;3 24 41 7 41 0 13 35;38 23 27 13 31 17 0 49;3 16 30 14 13 8 35 0];
R = rankmatrix(S)
[r lambda] = perron(R)

% 기본 function
A = [0 0 1 0 0;1 0 0 2 3;8 0 0 0 9;5 0 0 0 0;0 0 0 12 0];
[V,D] = eig(A);
E = eig(A);

% example 5.17
B = [1 6 3;-1 4 9;12 35 1];
[V E] = eig(B);
eig(B);

%% MATLAB PROBLEM
% 5.18
A = [1 -1;-1 2];
B = [5 1;-1 3];
C = [1 4;-1 3];
eigshow(A) % 현재는 matlab에 탑재되지 않은 함수

% 5.19 Diagonalization
A = [26 48 8;35 28 13;45 7 43];
[V E] = eig(A)
inv(V) * A * V;
E;

% 5.20
A = [1 6 0 -1 5;5 -9 22 2 1;0 1 3 5 7;9 0 -4 -7 -1;3 5 2 15 35];
[V E] = eig(A);

% 5.21
eig(wilkinson(11));
eig(wilkinson(21));

% 5.22 ranking problem
S = [0 17 25 25 10 30;38 0 24 48 21 29;20 31 0 14 24 17;36 3 25 0 24 45;24 30 13 14 0 0;28 24 20 10 23 0];
r_matrix = zeros(6,6);
for i=[1 2 3 4 5 6]
    for j=[1 2 3 4 5 6]
        if i==j
            r_matrix(i,j) =0;
        else
        r_matrix(i,j) = (S(i,j)+1)/(S(i,j)+S(j,i)+2);
        end
    end
end

a_matrix = zeros(6,6);
for i=[1 2 3 4 5 6]
    for j=[1 2 3 4 5 6]
        if S(i,j) >= S(j,i)
            a_matrix(i,j)=1;
            a_matrix(j,i)=0;
        end
    end
end

c_matrix = zeros(6,6);
for i=[1 2 3 4 5 6]
    for j=[1 2 3 4 5 6]
            c_matrix(i,j) = S(i,j)/(S(i,j)+S(j,i));
    end
end

[r_lambda r] = perron(r_matrix) % 5 1 4 2 6 3
[a_lambda a] = perron(a_matrix) % 6 2 3 1 4 5
[c_lambda c] = perron(c_matrix); % 안됨. 둘다 00인 경우..

% 5.23
A = [1 2 3;-3 -7 -4;-1 -3 1];
EA = eig(A);
EANIV = eig(inv(A));

% 5.24 Cayley-Hamilton theorem
A = [1 -1;3 5];
pa = poly(A);
B = [1 0 5;2 1 -6;0 2 3];
pb = poly(B);
C = [1 -5 2 55 12;0 4 13 6 -8;0 0 18 1 -56;0 0 0 -7 88;0 0 0 0 5];
pc = poly(C);

pa(1)*(A^2) + pa(2)*(A^1) + pa(3)*eye(2);
pb(1)*(B^3) + pb(2)*(B^2) + pb(3)*(B^1) + pb(4)*eye(3);
pc(1)*(C^5) + pc(2)*(C^4) + pc(3)*(C^3) + pc(4)*(C^2) + pc(5)*C + pc(6)*eye(5);

% 5.25
F = gallery('frank', 15,1);
det(F);
% F = gallery('frank', 14,1);
% det(F);
f1 = eig(F);
F = F+1.0e-8*ones(15,15);
f2 = eig(F);

% 5.26
A = [1 0 0;1 1 0;5 -3 1];
[V D] = eig(A) % 1 linearly independent eigenvector : [0 0 1]
B = [0.9999 0 0;0.9999 0.9998 0;4.9999 -3.0001 1.0001];
[V D] = eig(B); % 1.0001, 0.9998, 0.9999
d = [0 1.0e-6 1.0e-6;0 0 1.0e-6;0 0 0];
[V D] = eig(B+d) % 0.9854, 1.0072+0.0124i, 1.0072-0.0124i

% 5.27 Hanowa matrix
H = zeros(6,6);
H(1:3,1:3) = diag(ones(3,1)*3);
H(4:6,1:3) = diag([1 2 3]);
H(1:3,4:6) = -H(4:6, 1:3);
H(4:6,4:6) = H(1:3,1:3);
eig(H);

d = 3;
n = 20;
H(1:n/2,1:n/2) = diag(ones(n/2,1)*d);
H(n/2+1:n,1:n/2) = diag((1:n/2));
H(1:n/2,n/2+1:n) = -H(n/2+1:n, 1:n/2);
H(n/2+1:n,n/2+1:n) = H(1:n/2,1:n/2);
eig(H)

%formula : d +- (1:n/2)*(i)

