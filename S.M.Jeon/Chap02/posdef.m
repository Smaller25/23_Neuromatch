function s = posdef(A, X)
    s = X'*A*X;
    if s > 0
        disp('Postive define')
    else
        disp('This matrix is out of condition')
    end
end
