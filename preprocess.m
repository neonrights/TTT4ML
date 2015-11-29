function pX = preprocess(X)
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
    
    % first rotation
    pX = [pX; X * rotate];
    
    % second rotation
    pX = [pX; X * rotate * rotate];
    
    % final rotation
    pX = [pX; X * rotate * rotate * rotate];
end

