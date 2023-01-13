function y = triprod(A, x)
    sz_1 = size(A,1);
    sz_2 = size(A,2);
    y = zeros(sz_1, 1);
    for i=1:sz_1
        sum = 0;
        for j=1:sz_2
            sum = sum + A(i,j)*x(j,1);
        end 
        y(i,1) = sum;
    end
