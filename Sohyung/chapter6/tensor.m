function t = tensor(u,v)
    u = u';
    sz1 = size(u);
    sz2 = size(v);
    t = zeros(sz1(1), sz2(2));
    if sz1(2) ~= sz2(1)
        error('vector size is wrong!')
    else
        for i=1:sz1(1)
            for j=1:sz2(2)
                sum = 0;
                for p=1:sz1(2)
                    sum = sum + u(i,p) * v(p,j);
                end
                t(i,j) = sum;
            end
        end
    end
end

