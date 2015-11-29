% trains a tic tac toe machine learning algorithm
% trains it with the assumption the algorithm is going first
clear all; close all; clc

% constants
power = 4;
step = 1e-1;
threshold = 1e-5;
max_iter = 1e3;

% get data
% make sure data is properly formatted
X = load('ttt-input-x.txt');
Y = load('ttt-output-x.txt');
[X, Y] = preprocess(X, Y);

% polynomials to a power
pX = map_features(X, power);
n = size(pX, 2);

% init values
corner_a = ones(n , 1);
corner_Y = Y(:, 1);
corner_iter = 1;

side_a = ones(n, 1);
side_Y = Y(:, 2);
side_iter = 1;

middle_a = ones(n, 1);
middle_Y = Y(:, 5);
middle_iter = 1;

% get min value for three equations
[corner_cost, corner_grad] = cost_function(corner_a, pX, corner_Y);

% cost must be below threshold
while corner_cost > threshold && corner_iter < max_iter
    % alter a values
    corner_cost = 1e-6;
    corner_iter = corner_iter + 1;
end

disp('final corner values');
corner_cost
corner_iter
sum(abs(corner_a))