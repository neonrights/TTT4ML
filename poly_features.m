function pX = poly_features(X, p)
%poly_features creates polynomial features at the pth power
    [m, n] = size(X);
    pX = X;
    
    if p > 1
        temp1 = poly_features(X, p - 1);
        for ii = 1:n
            temp2 = X(1, ii) * temp1(1, :);
            for jj = 2:m
                 temp2 = [temp2; X(jj, ii) * temp1(jj, :)];
            end
            if ii == 1
                pX = temp2;
            else
                pX = [pX, temp2];
            end
        end
    end
end

