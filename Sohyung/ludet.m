function d = ludet(L,U)
    if size(L) ~= size(U)
        error(msg, 'L and U do not match');
    end
    d = det(L) * det(U);
end
   