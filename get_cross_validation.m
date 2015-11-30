function [pX, pY, cvX, cvY] = get_cross_validation(X, Y, p)
% get_cross_validation grabs a specified amount of data for cross
% validation randomly from a data set
    % pre-allocating space
    [m, nX] = size(X);
    nY = size(Y, 2);
    cvX = zeros(p, nX);
    cvY = zeros(p, nY);
    
    pX = X;
    pY = Y;
    
    for ii = 1:p
        row = round(m * rand);
        
        % add row and remove it from X
        cvX(ii, :) = pX(row, :);
        pX(row, :) = [];
        
        % add row and remove it from Y
        cvY(ii, :) = pY(row, :);
        pY(row, :) = [];
        
        % one less row in original dataset
        m = m - 1;
    end
end

