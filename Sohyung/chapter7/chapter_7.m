%% Vector and Matrix Norms
%% 1. Vector Vorm (length)
% ||u||2 = root(u1^2+u2^2+...+u^n)
% property 
    % 1) positivity : ||x|| >=0
    % 2) scaling : ||ax|| = |a|*||x||
    % 3) traingle inequality : ||x+y|| <= ||x||+||y||
% p-norm
    % 1) 1-norm : ||u||1 = sigma(|ui|)
    % 2) inf-norm : ||u||inf = max(|ui|)
    % 2) 2-norm : ||u||2 = root(sigma(ui^2))
        % property of 2-norm
        % 1) Cauchy-Schwarz inequality : |<u,v>| = |u'*v|<=||u||_2*||v||_2
        % 2) Pythagoream Theorem : ||u+v||_2 = ||u||_2^2 + ||v||_2^2
        % 3) orthogonal invariance : ||Px||_2 = ||x||_2 (for orthogonal P)
            % : orthogonal matrix를 곱하면 rotation은 되더라도 크기는 변하지 않는다. 
        % Spherical Coordinate(구 좌표계) & xyz 좌표계 변환 공식

%% Matrix Norms (magnitude)
% 1. Frobenius Norm : ||A||_F = entry들의 제곱의 합, induced form 아님(||I||_F 생각)
% 2. Induced Matrix Norm(subordinate matrix norm) : vector들의 길이로 유도한 행렬의 크기
% * Submltiplicative Matrix Norm : ||AB|| <= ||A||*||B|| 만족하는 경우 (F_norm도 해당)
    % ||A|| = max(x!=0)(||Ax||/||x||) = max(||x||=1)(||Ax||)
    % ||A||_inf = 절댓값의 합이 가장 큰 Row의 |entry| 합
    % ||A||_1 = 절댓값의 합이 가장 큰 Column의 |entry| 합
    % ||A||_2 계산 : root((A'*A)의 largest eigenvalue) / 증명은 (A'*A)의 Diagonalization 생각하기
        % Property of ||A||_2
        % 1) Orthogonal Invariance: orthogonal matrix U,V-> ||UAV||2=||A||2
        % 2) A가 symmetric하면, ||A||2 = p(A) : p(A)는 A의 spectral
        % radius(root(largest eigenvalue))
        % 3) A가 symmetric하면, singular value = eigenvalue의 absolute value
        % 4) ||A||2 = ||A'||2
        % 5) ||A'A||2 = ||AA'||2 = ||A||2^2
        % 6) ||inv(A)||2 = 1/(min(singular value of A))
% spectral theorem 
% real+symmectric matrix A에 대해서, D = P'A'P를 만족하는 orthogonal matrix P 존재
% D = eigenvalue diagonal / P = eigenvector를 column으로 갖는 orthogonal(basis임)

%--------------------------------------------
% Norm func
v = [1 -7 2]';
norm(v,1);
norm(v,'inf');
norm(v,2);
norm(v, 'fro');

% Cartesian Coordinate System(Spherical coordinate)
theta = pi/4
phi = pi/4
P = [sin(theta)*cos(phi) cos(theta)*sin(phi) -sin(phi);sin(theta)*sin(phi) cos(theta)*sin(phi) cos(phi); cos(theta) -sin(theta) 0];
P*[1 theta phi]'

[x y z] = sph2rect(2, theta, phi) % book software

% ||A||_2 Computation
A = [1 13 5 -9;12 55 5 -6;18 90 1 -1;3 0 2 3];
E = eig(A'*A);
sqrt(max(E))== norm(A,2); % 약간의 오차는 있는 듯

%----------------------------
%7.24 (m*n matrix A)
A = [1 0 1;1 1 1;0 0 1;1 1 1;0 1 1;1 1 0];
% (1/root(n))*||A||inf <= ||A||2 <= root(m)*||A||inf
1/sqrt(6)* norm(A,'inf') <= norm(A, 2);
norm(A,2) <= sqrt(3)*norm(A, 'inf');

%(1/root(m))*||A||1 <= ||A||2 <= root(n)*||A||1
1/sqrt(3)*norm(A,1) <= norm(A,2);
norm(A,2) <= sqrt(6) * norm(A,1);

%7.25
A = randi(15, 2,2);
approx1norm(A);

%7.26 Cartesian Coordinate
theta = 3/8*pi;
phi = pi/6;
P = [sin(theta)*cos(phi) cos(theta)*sin(phi) -sin(phi);sin(theta)*sin(phi) cos(theta)*sin(phi) cos(phi); cos(theta) -sin(theta) 0];
re_coor = P*[2 theta phi]';
quiver3(re_coor(1)*ones(1,4), re_coor(2)*ones(1,4), re_coor(3)*ones(1,4), [1 0 0 2],[0 1 0 theta], [0 0 1 phi]);

%7.27
A = [1 -1;3 5];
[max_x, min_x] = matimage(A);
norm(A*max_x) % == norm(A)
1/norm(A*min_x) % == norm(inv(A))

%7.28
n = 49;
theta = (0:n)/n*pi;
r = theta.*theta;
phi = theta;
[X,Y,Z] = pol2cart(r,theta,phi);
surf(reshape(X,[10,-1]),reshape(Y,[10,5]),reshape(Z,[10,5]))

%7.29 magic square(마방진)
M = [16 2 3 13;5 11 10 8;9 7 6 12;4 14 15 1];
% magic square sum formula : n(n^2 + 1)/2
A = magic(1000);
% time 계산하기 (좀 귀여움)
tic;norm(A,1);toc % 0.008859 sec
tic;norm(A,2);toc % 0.145558 sec
tic;norm(A,'inf');toc % 0.001761 sec
tic;norm(A,'fro');toc % 0.009194 sec
% comment : norm(A,2) > norm('fro') > norm(1) > norm('inf')

%7.30 Floating point arithnetic
% condition number : ||A||_2, ||inv(A)||_2 (클수록 error도 커진다)
A = [1 3 -1;5 -1 2;1 7 8];
B = [-4.0000 0.5000 0.3333 0.2500;-120.0000 20.0000 15.0000 12.0000;240.0000 -45.0000 -36.0000 -30.0000;-140.0000 28.0000 23.3333 20.0000];
norm(A); % 10.8654
norm(inv(A)); % 0.3342
norm(B); % 313.5254
norm(inv(B)); % 315.7360

%7.31
A = diag([0.6 0.6 0.6 0.6 -0.7],0) + diag([1 1 1 1],1) + diag([6 1 3],2) + diag([-1 0],3) + diag(5,4);
[V D]= eig(A); % no basis for R5
% spectral radius
sqrt(max(eig(A'*A))); % 8.3558
hold on;
for n = 0:50
    scatter(n,norm(A^n))
end
hold off; % max : A^4

%----- another matrix -----
B = randi(3,4,4)/10
sqrt(max(eig(B'*B)))
hold on;
for n = 0:50
    scatter(n,norm(B^n))
end
hold off; % max : B^1

%----- symmetric matrix -----
C = pascal(4)/20;
sqrt(max(eig(C'*C)))
hold on;
for n = 0:50
    scatter(n,norm(C^n))
end
hold off; % max : 뒤쪽으로 갈수록 증가

%7.32
n = 5; %15, 25
u = rand(n,1);
v = rand(n,1);
rank(u*v')
norm(u)*norm(v) % == norm(u*v')
norm(u*v')
% 정의상 norm(u*v')=(u1*v1)^2+(u1*v2)^2+...+(un*vn)^2,
% norm(u) = (u1)^2+...+(un)^2, norm(v) = (v1)^2+...+(vn)^2,
% norm(u)*norm(v) =(u1*v1)^2+(u1*v2)^2+...+(un*vn)^2=norm(u*v')
% rank=1 -> [u1*v1, u1*v2, ..., u1*vn]으로 나머지 ui*(v1,v2..vn) 표현 가능하다
% nullity=n-1 -> linearly independent 하다...?

%7.33
n = 15;
A = randi([-100 100],n,n);
max(max(abs(A)))
norm(A, 'inf')
norm(A,1)
norm(A,2)
norm(A,'fro')
