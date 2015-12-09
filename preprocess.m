function [pX, pY] = preprocess(X, Y)
% preprocess rotates the data creating more data to train with
% it takes advantage of the fact that a board like so:
%   x|x|                               | |x     | |   
%   -+-+-                             -+-+-    -+-+-
%    | |  is effectively the same as:  | |x or  | |
%   -+-+-                             -+-+-    -+-+-
%    | |                               | |     x|x|
% among other rotations and mirrors
    % rotation matrix
    rotate_90 = [0 0 0 0 0 0 1 0 0;
                 0 0 0 1 0 0 0 0 0;
                 1 0 0 0 0 0 0 0 0;
                 0 0 0 0 0 0 0 1 0;
                 0 0 0 0 1 0 0 0 0;
                 0 1 0 0 0 0 0 0 0;
                 0 0 0 0 0 0 0 0 1;
                 0 0 0 0 0 1 0 0 0;
                 0 0 1 0 0 0 0 0 0];
    % mirror matrices
    mirror_horizontal = [0 0 0 0 0 0 1 0 0;
                         0 0 0 0 0 0 0 1 0;
                         0 0 0 0 0 0 0 0 1;
                         0 0 0 1 0 0 0 0 0;
                         0 0 0 0 1 0 0 0 0;
                         0 0 0 0 0 1 0 0 0;
                         1 0 0 0 0 0 0 0 0;
                         0 1 0 0 0 0 0 0 0;
                         0 0 1 0 0 0 0 0 0];
    mirror_vertical = [0 0 1 0 0 0 0 0 0;
                       0 1 0 0 0 0 0 0 0;
                       1 0 0 0 0 0 0 0 0;
                       0 0 0 0 0 1 0 0 0;
                       0 0 0 0 1 0 0 0 0;
                       0 0 0 1 0 0 0 0 0;
                       0 0 0 0 0 0 0 0 1;
                       0 0 0 0 0 0 0 1 0;
                       0 0 0 0 0 0 1 0 0];
    % no changes
    pX = X;
    pY = Y;
    
    % first rotation
    tempX1 = X * rotate_90;
    tempY1 = Y * rotate_90;
    
    % second rotation
    tempX2 = X * rotate_90 * rotate_90;
    tempY2 = Y * rotate_90 * rotate_90;
    
    % final rotation
    tempX3 = X * rotate_90 * rotate_90 * rotate_90;
    tempY3 = Y * rotate_90 * rotate_90 * rotate_90;
    
    % mirror horizontal
    tempX4 = X * mirror_horizontal;
    tempY4 = Y * mirror_horizontal;
    
    % mirror vertical
    tempX5 = X * mirror_vertical;
    tempY5 = Y * mirror_vertical;
    
    % first diagonal mirror
    tempX6 = X * mirror_vertical * rotate_90;
    tempY6 = Y * mirror_vertical * rotate_90;
    
    % other diagonal mirror
    tempX7 = X * mirror_horizontal * rotate_90;
    tempY7 = Y * mirror_horizontal * rotate_90;
    
    for ii = 1:size(X, 1)
        if isequal(X(ii, :), tempX1(ii, :)) == 0
            pX = [pX; tempX1(ii, :)];
            pY = [pY; tempY1(ii, :)];
        end
        if isequal(X(ii, :), tempX2(ii, :)) == 0
            pX = [pX; tempX2(ii, :)];
            pY = [pY; tempY2(ii, :)];
        end
        if isequal(X(ii, :), tempX3(ii, :)) == 0
            pX = [pX; tempX3(ii, :)];
            pY = [pY; tempY3(ii, :)];
        end
        if isequal(X(ii, :), tempX4(ii, :)) == 0
            pX = [pX; tempX4(ii, :)];
            pY = [pY; tempY4(ii, :)];
        end
        if isequal(X(ii, :), tempX5(ii, :)) == 0
            pX = [pX; tempX5(ii, :)];
            pY = [pY; tempY5(ii, :)];
        end
        if isequal(X(ii, :), tempX6(ii, :)) == 0
            pX = [pX; tempX6(ii, :)];
            pY = [pY; tempY6(ii, :)];
        end
        if isequal(X(ii, :), tempX7(ii, :)) == 0
            pX = [pX; tempX7(ii, :)];
            pY = [pY; tempY7(ii, :)];
        end
    end
end

