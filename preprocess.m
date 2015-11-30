function pX = preprocess(X)
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
    
    % first rotation
    pX = [pX; X * rotate_90];
    
    % second rotation
    pX = [pX; X * rotate_90 * rotate_90];
    
    % final rotation
    pX = [pX; X * rotate_90 * rotate_90 * rotate_90];
    
    % mirror horizontal
    pX = [pX; X * mirror_horizontal];
    
    % mirror vertical
    pX = [pX; X * mirror_vertical];
    
    % first diagonal mirror
    pX = [pX; X * mirror_vertical * rotate_90];
    
    % other diagonal mirror
    pX = [pX; X * mirror_horizontal * rotate_90];
end

