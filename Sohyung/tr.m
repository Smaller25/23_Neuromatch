function t = tr(A)
    t = 0;
    sz_1 = size(A,1);
    sz_2 = size(A,2);
    if sz_1 ~= sz_2
        dsp('matrix is not n*n')
    end
    for i=1:sz_1
        t = t + A(i,i);
    end
end
    
        

