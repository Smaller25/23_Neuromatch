function y = sol_type(A,b)
    if A(3,1) == 0 && A(3,2)== 0 && A(2,1) == 0 && b(3,1) == 0
        y ='infinite';
    end

    if A(3,1) == 0 && A(3,2)== 0 && A(2,1) == 0 && b(3,1) ~= 0
        y ='no solution';
    end
    
    if A(3,1) ~=0 || A(3,2) ~=0 || A(2,1) ~=0
        y ='A is not a upper-triangular form';
    end
end
