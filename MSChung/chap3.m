%%
% chapter 3
% exapmle 3.13.
A=[2 5 -4 1;3 8 -9 2;1 1 7 -1;1 2 1 0];
rank(A)

Z=null(A);
(A*Z(:,1))'

size(null(A),2)

%%
% chapter 4
% Example 4.14
A= [1 6 25;16 32 19;56 53 5];
det(A)

A\[1 2 5]'

B=[1 3 2;5 14 7;2 5 1];
det(B)

size(null(B),2)

B\[1 2 5]'

%%
% Example 4.16
syms a A
