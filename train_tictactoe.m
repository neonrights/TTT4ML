% trains a tic tac toe machine learning algorithm
% trains it with the assumption the algorithm is going first
% change data input if you want it to go second
clear all; close all; clc

% constants, change as you see fit
power = 4;
step = 1e-1;
threshold = 1e-6;
max_iter = 1e4;
cv_size = 150;

% get data
% make sure data is properly formatted
X = load('ttt-input-x.txt');
Y = load('ttt-output-x.txt');
disp('loaded data');

% rotating data to increase amount
X = preprocess(X);
Y = preprocess(Y);
disp('pre-processed data');

% polynomials to a power
pX = map_features(X, power);

% adding constant
pX = [ones(size(pX, 1), 1) pX];
n = size(pX, 2);
disp('mapped data');

% set aside cross-validation data
%[pX, Y, cvX, cvY] = get_cross_validation(pX, Y, cv_size);
%disp('generated cross-validation set');

% init values
corner_a = ones(n , 1);
corner_Y = Y(:, 1);
corner_iter = 0;
corner_bias = 0;

side_a = ones(n, 1);
side_Y = Y(:, 2);
side_iter = 0;
side_bias = 0;

middle_a = ones(n, 1);
middle_Y = Y(:, 5);
middle_iter = 0;
middle_bias = 0;

% get min value for three equations
% train corner
[corner_cost, corner_grad] = cost_function(corner_a, pX, corner_Y, corner_bias);
last_cost = corner_cost + 1;

% change of cost is below threshold
while abs(corner_cost - last_cost) > threshold && corner_iter < max_iter
    % alter a values
    corner_a = corner_a - corner_grad * step;
    last_cost = corner_cost;
    
    % update values
    [corner_cost, corner_grad] = cost_function(corner_a, pX, corner_Y, corner_bias);
    
    corner_iter = corner_iter + 1;
end

% calculate cross-validation cost
[corner_cv, ~] = cost_function(corner_a, cvX, cvY(:, 1), 0);

disp('final corner values');
disp(corner_cost);
disp(corner_iter);
disp(sum(abs(corner_grad)) / n);
disp(corner_cv);

% train side
%[side_cost, side_grad] = cost_function(side_a, pX, side_Y, side_bias);
last_cost = side_cost + 1;

% change of cost is below threshold
while abs(side_cost - last_cost) > threshold && side_iter < max_iter
    % alter a values
    side_a = side_a - side_grad * step;
    last_cost = side_cost;
    
    % update values
    [side_cost, side_grad] = cost_function(side_a, pX, side_Y, side_bias);
    
    side_iter = side_iter + 1;
end

% calculate cross-validation cost
%[side_cv, ~] = cost_function(side_a, cvX, cvY(:, 2), 0);

disp('final side values');
disp(side_cost);
disp(side_iter);
disp(sum(abs(side_grad)) / n);
disp(side_cv);


% train middle
[middle_cost, middle_grad] = cost_function(middle_a, pX, middle_Y, middle_bias);
last_cost = middle_cost + 1;

% change of cost is below threshold
while abs(middle_cost - last_cost) > threshold && middle_iter < max_iter
    % alter a values
    middle_a = middle_a - middle_grad * step;
    last_cost = middle_cost;
    
    % update values
    [middle_cost, middle_grad] = cost_function(middle_a, pX, middle_Y, middle_bias);
    
    middle_iter = middle_iter + 1;
end

% calculate cross-validation cost
%[middle_cv, ~] = cost_function(middle_a, cvX, cvY(:, 5), 0);

disp('final middle values');
disp(middle_cost);
disp(middle_iter);
disp(sum(abs(middle_grad)) / n);
disp(middle_cv);