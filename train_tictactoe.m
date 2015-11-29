% trains a tic tac toe machine learning algorithm
clear all; close all; clc

% constants
power = 4;

% get data
% make sure data is properly formatted
X = load('ttt-input-x.txt');
Y = load('ttt-output-x.txt');
[X, Y] = preprocess(X, Y);

% polynomials to a power
pX = map_features(X, power);
n = size(pX, 2);

% init values
init_a = ones(n, 1);

% get min value using fminunc
