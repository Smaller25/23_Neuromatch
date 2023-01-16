%% chapter 3. Subspaces
%---------------------------
% R^n : real-value로 구성된 n-dimensional column vectors
% subspace of R^n = a subset S of R^n (0벡터 포함, 합과 스칼라 곱에 닫혀있다)
% row space 'R(A)': A의 row로 span되는 subspace
% column space 'C(A)': A의 column들로 span 되는 subspace
% null space 'N(A)': Ax=0이 되도록 하는 모든 x (nx1)

% Linear Combination : c1x1 + c2x2 (c1, c2: 스칼라)
% span : span{x1, x2, ..., xm} = x1,x2...의 선형결합

% Linear Independence : c1x1+...+cmxm = 0이 되도록 하는 스칼라 배열 {Ci}이 0벡터를 제외하고
% 하나라도 있는 경우, linearly dependent 라고 한다 => [x1x2..xm][c]^T=0을 만족하는 해의 개수로 판단

% Basis : {x1,...xm}이 S를 span한다(선형 결합으로 S의 모든 벡터 표현한다) + {x1.,,,xm}이 선형독립이다
% standard basis : ex = x이 되도록 하는 basis "e" vector
% S가 R^n의 subspace 이려면 : 1) S의 모든 basis의 dim(element 개수)가 같아야 함 2) dim이 m인
% 경우, basis 개수도 m 이어야 함

% Rank : Row space의 basis의 dim(element 개수) = pivot 개수
% original matrix의 Row space = row reduction된 matrix의 Row space (선형 결합으로 표현
% 가능하므로)

% Row space의 basis 찾으려면 elimination 해서 pivot Row만 남기면 됨
% Null space : Ax=0이 되도록 하는 x 찾기: Elimination하고, pivot 없는 row 만큼 [1 0][0 1]
% 이런 식으로 표현해서 쓰면 됨
% nullity = Null space의 basis 개수 = pivot 없는 row 개수
% rank(pivot row 개수) + nullity = matrix size(n x n -> n)

% column space : pivot이 있는 column이 basis

%---------------------------
% example 3.2
x2 = -10:1:10;
x1 = (-2)*x2;
plot(x1, x2)

% example 3.12 
A = [2 5 -4 1;3 8 -9 2;1 1 7 -1;1 2 1 0];
el_A = [1 0 13 -2;0 1 -6 1;0 0 0 0;0 0 0 0];
rank(A);
rank(el_A);
Z = null(A);
size(null(A),2);
el_Z = null(el_A);
(A*Z(:,1))'; % 원래는 row vectors of zeros, 하지만 연산 상 다르게 나옴


% 3.17 
A = rosser;
rank(A) < size(A,1) % True -> 'rank deficient'
inv(A); % 불가능
issymmetric(A); % True

% 3.18
D = [1 3 7 1 1 1 5 0;2 2 6 0 1 7 3 1;1 1 3 1 0 2 1 0];
size(null(D, 'r'),2); % 'r' option : row reduction으로 찾게끔 한다
null(D, 'r');
rank(D);

% 3.19 
A = gallery('clement', 5);
rank(A);
rank(A) < size(A,1) % rank deficient

inv(A); % singular = noninvertible -> det(A) /= 0 인 경우 nonsingular(필요충분)

B = A;
B(1,1) = 1.0e-14;
B(2,2) = 1.0e-14;
B(3,3) = 1.0e-14;
rank(B); % 5
inv(B);
% rank deficient하다고 할 수 있는가? -> yes (아주 작은 수로 대체해놨기 때문)

% 3.20
A = [1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16];
rank(A); % 2
U = [1 1 0 0 ;0 1 1 0;0 0 1 1 ;0 0 0 1];
rank(U); % 4
rank(A*U); % 2
rank(U*A); % 2

% 3.14까지는 해결, 3.15는 증명 어려움

% 3.21
B = [-1 1 2;4 5 6;7 8 9;10 11 12];
rank(A); % 2, rank(A) = rank(A')
rank(B); % 5, rank(B) = rank(B')
rank(A'*A); % 2, <= min(2,2)
rank(B'*B); % 4, <= min(5,5)
% rank(N'*N) <= rank(N)



