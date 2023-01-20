%% Chapter 4. Determinants
%% Definition
% Determinant(행렬식) : 행렬의 특성을 결정짓는 스칼라 값을 지칭하며, 특별한 정의가 있다기 보단 실용적인 면에서 사용
% 2x2 matrix인 경우 : det(A) = a11a22-a12a21
% 3x3 matrix인 경우 : det(A) = a11a22a33+a12a23a31+a13a21a32
% -a11a23a32-a12a21a33-a13a22a31
% = a11(a22a33-a23a32)-a12(a21a33-a23a31)+a13(a21a32-a22a31)
% = a11(det(A(2:3,(2,3))) - a12(det(A(2:3,(1,3)) - a13(det(A(2:3,(1,2)))

% nxn matrix에 대해서 recursive하게 구할 수 있다. 
% nxn matrix A, det(A)=|A|=sigma(j=1 to n) {(-1)^(1+j)*a(1j)*M(1j)}
% row, column 선택해서 0이 제일 많은 줄로 골라서 하면 계산 간편함!!

% Cofactor : Cij(A) = (-1)^(i+j)*Mij(A)
% Adjoint : adj(A) = [C11 C21...Cn1;C12 C22...Cn2;...;C1n C2n...Cnn]
%---------------------------
%% property 
% det(A') = det(A)
% lower triangular matrix : 계산하기 편함 : det(A) = a11a22a33...ann
% Diagonal matrix : det(A) = a11a22...ann -> 스칼라 값 t로 t*I 만들면->det(tI)=t^n
% det(AB) = det(A)det(B)

% A * adj(A) = det(A) * I
% inv(A) = 1/det(A) * adj(A)

% Row Elimination 
% 1) determinant(행렬식) is a linear function of each row seperately
% 2) 2개 이상의 row가 동일하면 det(A) = 0
% 3) Row exchange 1회 -> det 값은 그대로, 부호만 반대 
% 4) Row끼리 곱셈하고 빼는 작업해도 determinant 안 변함

% det(A) /= 0 == nonsingular (inverse 존재)
% det(A) = 0 == singular (inverse 존재안함) 
% homogenous system(동차방정식) Ax=0이 nontrivial solution == (det(A) =0)
%---------------------------
%% Application
% Cramer's Rule : 2x2, 3x3 이상은 잘 사용 안함 / Ax = b의 해 구하는 데 사용 

% Application : Encrypton (분수는 전자신호로 보내기 복잡해서 피한다. 정수 암호화 방법)
% Theorem) if det(A) +-1, inv(A)의 모든 원소는 정수 (inv(A) = 1/det(A) * adj(A))
% inv(A) * (A*B) = B
% B = original message, A = encoding matrix, inv(A) = decoding matrix

%---------------------------
% example 4.6
A = [1 4 5;0 -9 12;0 0 2];
B = [8 0 0;100 2 0;2 6 -1];
det(A); % det(A) = det(A') = 1*(-9)*2 = -18
det(B); % det(B) = 8*2*(-1) = -16
det(A*B); % (-18)*(-16) = 288

% example 4.7 Checkboard patterns of signs : 그냥 만듦
sign_matrix = ones(10,10);
for i=1:10
    for j=1:10
        sign_matrix(i,j) = (-1)^(i+j);
    end
end
sign_matrix;

% example 4.13 vandermonde matrix
A = vander(1:5);

% example 4.14 
A = [1 6 25;16 32 19;56 53 5];
det(A);
A\[1 2 5]'; % Ax = [1 2 5]'의 해를 찾는 식

B = [1 3 2;5 14 7;2 5 1];
det(B); % 거의 0 -> singular matrix
size(null(B),2);
B\[1 2 5]';

% example 4.16 Symbolic Math Toolbox
syms a A
A = [1 -2 3;a 3 2;6 1 a];
D = det(A);
vals = solve(D);

A(2,1) = vals(1);
A(3,3) = vals(1);
null(A);

colspace(A);

% example 4.17 Cramer's Rule
A = [1 -1 5;8 3 12;-1 -9 2];
b = [5 1 3]';
delta = det(A);
x1 = det([b A(:,2) A(:,3)])/delta
x2 = det([A(:,1) b A(:,3)])/delta
x3 = det([A(:,1) A(:,2) b])/delta
A\b

% 4.21
A = [1 19 -122;3 57 -366;-1 -19 122];
B = [1 0.25 -9.25;3 -.75 -27.75;-17 4.25 216.75];
size(null(A),2); % rank = 3-2 = 1
size(null(B),2); % rank = 3-0 = 3 (Full rank matrix)

% 4.22
A = [246 427 327;1014 543 443;-342 721 621];
B = [1 2 3 4;-2 1 -4 3;3 -4 -1 2;4 3 -2 -1];
det(A); % -2.9400e+07 (-29400000)
det(B); % 900

% 4.23
syms t B;
B = [1 1 2 1;1 2 3 4;2 4 7 2*t+6;2 2 6-t t];
D = det(B);
vals = solve(D);

% 4.24
A = sym([246 427 327;1014 543 443;-342 721 621]);
B = sym([1 2 3 4;-2 1 -4 3;3 -4 -1 2;4 3 -2 -1]);
A_C = colspace(A);
B_C = colspace(B);

% 4.25 
A = [20 -34 8 12 3;-99 17 23 67 10;1 0 3 9 18;3 5 0 9 11;7 1 53 5 55];
det(A); % 2.3215e+07 (23215000)

% 4.26
A_1 = rosser;
rank(A_1); % 7: full rank 아님
det(A_1); % -9.4806e+03

syms A;
A = sym(rosser);
det(A); % 0 
% 첫번째 방법은 Gauss Elimination으로 해서 구하는 방식이므로, 이 과정에서 부동소수점 반올림 오차가 발생하기 쉽다.

% 4.27
for i=[5 10 25 50 100 250 400 500 600]
    det(rand(i))
end
% 600부터는 Inf로 뜬다 : 너무 많아서..?

% 4.28
fibmat = @(n) eye(n) + diag(repmat(sqrt(-1),n-1,1),1) + diag(repmat(sqrt(-1),n-1,1),-1);
spy(fibmat(5));
figure(2);
spy(fibmat(10));
figure(3);
spy(fibmat(25));

for n=1:10
    det(fibmat(n))
end
% det 값이 피보나치 수열과 동일함. fibmat으로 만들어진 matrix는 complex number(복소수)이고,
% diagonal 부분은 1, sub/super-diagonal 부분은 i 값을 포함하고 있음. 
% Tridiagonal matrix(nxn, An)의 경우, diagonal = a, sub = c, super = b이라고 한다면ㄴ
% By Laplace expansion, det(An) = a*det(An-1) - b*c*det(An-2)
% fibmat의 경우, a=1, b,c=i 이므로 det(An) = det(An-1) + det(An-2)

% 4.29
A = [1 4 3;2 9 12;-1 -9 3];
L = [1 0 0;2 1 0;-1 -5 1];
U = [1 4 3;0 1 6;0 0 36];

ludet(L, U);
% lugauss(A) % 없는 함수라는데..?

% 4.30
for i=[5 10 15 25]
    det(hilb(i))
end % 점차 감소해서 0에 수렴

inv(hilb(5));

for i=[5 10 15 25]
    det(inv(hilb(i)))
end

% 4.31
C = 'I LOVE LINEAR ALGEBRA';
unicode_C = reshape(double(C),3,[]);
code_m = magic([3 3]);

coded_C = code_m * unicode_C;
rest_C = inv(code_m) * coded_C;

char(reshape(rest_C, 1, []))



