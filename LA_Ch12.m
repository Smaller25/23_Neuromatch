%%CH1

%1.1.3 Matlab Examples
A=[1 5 1;2 -1 6;1 0 3]
B=[2 3 0;3 -1 7;4 8 9]

5*A -10*B + 3*A*B
trace(A+B)
7*trace(A+B)
trace(A*B)
trace(B*A) %trace는 행렬 곱 순서와 독립적임

%Example 1.9
A=[1 1;1 0]  %피보나치 수열
A^8

%Exmaple 1.13
format rational;
A = [1 3 -1;4 1 6;0 2 3]
A_inv = inv(A)

B = [1 4 0;3 5 1;2 -7 8]
B_inv = inv(B)

inv(A*B)

B_inv*A_inv

%Example 1.15
A = [1 8 -1;3 -9 15; -1 5 3]
A' 
A_TA = A'*A
A_TA - A_TA' 

%%CH2

%Example 2.7
A=[1 -2 3;2 -3 4;3 -4 5]
b=[4 5 7]'
format short
A\b

B=[1 3 -1;3 5 2;1 5 3]
B\b