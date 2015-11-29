function [cost, grad] = cost_function(a, X, y)
%cost_function computes and returns the cost of a logistic regression as
%well as its slope
    m = length(y); % number of training examples
    logistic = (1 + exp(- X * a)).^-1; % current logistic output
    
    cost = -(y' * log(logistic) + (1 - y)' * log(1 - logistic)) / m;
    grad = X' * (logistic - y) / m;
end

