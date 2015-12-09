% trains a tic tac toe machine learning algorithm
% trains it with the assumption the algorithm is going first
% change data input if you want it to go second
clear all; close all; clc

% constants, change as you see fit
power = 4;
step = 1e-1;
threshold = 1e-6;
max_iter = 1e4;
cv_size = 50;

% get data
% make sure data is properly formatted
X = -load('ttt-input-o.txt');
Y = -load('ttt-output-o.txt');
disp('loaded data');

% rotating data to increase amount
[X, Y] = preprocess(X, Y);
disp('pre-processed data');

% polynomials to a power
pX = map_features(X, power);

% adding constant
pX = [ones(size(pX, 1), 1) pX];
n = size(pX, 2);
disp('mapped data');

% set aside cross-validation data
[pX, Y, cvX, cvY] = get_cross_validation(pX, Y, cv_size);
cvY = [cvY(:, 1), cvY(:, 2), cvY(:, 5)];
disp('generated cross-validation set');

% init values
a = -ones(n , 3);
pY = [Y(:, 1), Y(:, 2), Y(:, 5)];
iter = zeros(1, 3);
bias = zeros(1, 3);
cost = zeros(1, 3);
grad = zeros(n, 3);
cv = zeros(1, 3);

% get min value for three equations
for ii = 1:3
    [cost(ii), grad(:, ii)] = cost_function(a(:, ii), pX, pY(:, ii), bias(ii));
    last_cost = cost(ii) + 2 * threshold;

    % change of cost is below threshold
    while abs(cost(ii) - last_cost) > threshold && iter(ii) < max_iter
        % alter a values
        a(:, ii) = a(:, ii) - grad(:, ii) * step;
        last_cost = cost(ii);

        % update values
        [cost(ii), grad(:, ii)] = cost_function(a(:, ii), pX, pY(:, ii), bias(ii));

        iter(ii) = iter(ii) + 1;
    end

    % calculate cross-validation cost
    [cv(ii), ~] = cost_function(a(:, ii), cvX, cvY(:, ii), 0);

    if ii == 1
        disp('final corner values');
    elseif ii == 2
        disp('final side values');
    else
        disp('final middle values');
    end
    disp(cost(ii));
    disp(iter(ii));
    disp(sum(abs(grad(:, ii))) / n);
    disp(cv(ii));
end