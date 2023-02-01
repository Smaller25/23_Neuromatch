%% chapter 6. Orthogonal
%% Definition
% inner product = <a,b> = a*b = xTy =yTx
% Law of cosine : 삼각형의 세변 a,b,c -> a^2=b^2+c^2-2bc*cos(각BAC)
% Orthonognal : pTp = I / pT=inv(p) / p^2=p*p=I
% Orthonormal vector(정규직교벡터): 길이가 모두 1일때(unit vector)이고 두 벡터가 서로 직교인 경우
% Orthogonal matrix : 각 column이 orthonormal인 경우

%% Property
% P(orthogonal) -> det(P)= +-1
% real symmetric matrix A -> eigenvector들끼리 orthogonal
% Diagonalization : inv(X)*A*X = D (X는 eigenvector들을 column으로 갖는 matrix,
% D는 eigenvalue를 대각에 갖는 대각 행렬) 
    % multiple eigenvalue여도 각기 다른 eigenvector 가지면 대각화 가능

%% L2 inner product (연속함수로 확장)
% <f,g>L2 = integral[a,b]{f(t)*g(t)} dt
% 스칼라 배, vector size 정의도 성립

%% Cauchy-Schwarz Inequality (코시 슈바르츠 부등식)
% |<u,v>| <= ||u||_2 * ||v||_2 (등호 성립 조건 : v=cu)
% triangle inequality : ||u+v||_2 <= ||u||_2+||v||_2

%% Application : Signal Comparison
% umax = max{f(u,v)} : u=member signal, v=target signal
%--------------------
%6.35
v = [-1 2 4 12 -3]';
d1 = veclength(v);
v = [-1 35 52 6]';
d2 = veclength(v);

%6.36
A = [1 -1 5 0 3;5 -1 3 6 1;8 -9 2 7 4;8 4 -3 5 1;-1 -4 3 0 2];
[U S V] = svd(A);
ans = veclength(A-U*S*V'); %1.5288e-14 : 0에 근접

diag(sort(eig(A'*A), 'descend'))-S^2; %1.0e-12

%6.37
u = [3.2 -1.5 6.3 -2.5]';
v = [4.3 0 1.8 10.04]';

u'*v; % 3.5227e-15
3.2*4 + 0.3 * 5 + 6 * 1.8 - 25.1; % 0

%6.38
P1 = [-0.40825 0.43644 0.80178; -0.8165 0.21822 -0.53452; -0.40825 -0.87287 0.26726];
det(P1);
P1'*P1;
veclength(P1(:,1));

%6.39
P1 = [-0.58835 0.70206 0.40119;-0.78446 -0.37524 -0.49377;-0.19612 -0.60523 0.77152];
P2 = [-0.47624 -0.4264 0.30151;0.087932 0.86603 -0.40825; -0.87491 -0.26112 0.86164];
P1'*P1;
P2'*P2;

%6.40
[Q R] = qr(A);
Q'*Q;

%6.41 : Hermitian Conjugate(Conjugate Transpose)
% A의 conjugate tranpose = A* (또는 A^H)
% A* = A -> "Hermitian matrix"
A = [1-i 3+i 7 8-3i;6+7i 4-i i 1+i;2-3i 6+i 3 9+i;-1-i 10+i 7 12+2i];
eig(A); % complex
% (c):당연히 Diag entry 값은 real 일 수밖에 없음. transpose 안되니까... 켤레 취하기 이전과 무조건 동일

%6.42 : vector product(벡터곱)
% matla에서는 3차원으로 고정된 경우만 cross()로 계산 가능 (한계)
u = randi(15,3,1);
v = randi(15,3,1);
c = mycross(u,v);
cross(u,v);

%6.43 : tensor product/inner product(내적)
t = tensor(u,v);
t == dot(u,v); % 1차원 벡터끼리의 내적은 dot()함수로 구할 수 있다

s1 = randi(15,5,5);
s2 = randi(15,5,5);
t = tensor(s1,s2); 
t == s1'*s2; % 2차원 행렬부터는 dot() 함수로 커버 불가. 원래 정의인 s'*t는 가능



