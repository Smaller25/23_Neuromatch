function max = approx1norm(A)
%APPROXINFNORM Generate 10,000 random values on the unit circle for the
%infinity norm in the plane. Return the maximum value of norm(A*x, ’inf’).
%input : Matrix A
%output : real value max
max = 0.0;
for i = 1:10000
    r = 1 - 2*rand;
    if i <= 2500
        x = [1.0 r]';
    elseif i <= 5000
        x = [r, 1.0]';
    elseif i <= 7500
        x = [-1.0 r]';
    else
        x = [r -1.0]';
    end

    bvalue = norm(A*x,1);
    if bvalue > max
        max = bvalue;
    end
end