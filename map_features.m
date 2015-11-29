function pX = map_features(X, p)
%map_features creates polynomial features up to pth power
    pX = X;
    
    for ii = 2:p
        pX = [pX, poly_features(X, ii)];
    end
end

