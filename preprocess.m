function [pX, pY] = preprocess(X, Y)
%preprocess rotates the data creating more data to train with
    % rotation matrix
    rotate = [0 0 0 0 0 0 1 0 0;
              0 0 0 1 0 0 0 0 0;
              1 0 0 0 0 0 0 0 0;
              0 0 0 0 0 0 0 1 0;
              0 0 0 0 1 0 0 0 0;
              0 1 0 0 0 0 0 0 0;
              0 0 0 0 0 0 0 0 1;
              0 0 0 0 0 1 0 0 0;
              0 0 1 0 0 0 0 0 0];
    pX = X;
    pY = Y;
    
    % first rotation
    pX = [pX; X * rotate];
    pY = [pY; Y * rotate];
    
    % second rotation
    pX = [pX; X * rotate * rotate];
    pY = [pY; Y * rotate * rotate];
    
    % final rotation
    pX = [pX; X * rotate * rotate * rotate];
    pY = [pY; Y * rotate * rotate * rotate];
end

