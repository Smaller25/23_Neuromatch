function d = veclength(v)
    d=0;
    sz = size(v);
    for i=1:sz(1)
        for j=1:sz(2)
            d = d + v(i,j)^2;
        end
    end
    d = sqrt(d);
end