function c = mycross(u,v)
    c = zeros(3,1);
    c(1) = u(2)*v(3)-u(3)*v(2);
    c(2) = u(3)*v(1)-u(1)*v(3);
    c(3) = u(1)*v(2)-u(2)*v(1);
end

