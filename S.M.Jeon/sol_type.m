function b = sol_type(A)
    if A(3,:) ~= 0
        disp('no solution')
    elseif A(3,:) == 0
        disp('infinite')
    end
end
