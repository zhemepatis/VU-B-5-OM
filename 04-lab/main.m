%% variable clean up
clearvars; clc;

%% defining matrices
C = [2, -3, 0, -5];
A = ...
[
    [-1, 1, -1, -1];
    [2, 4, 0, 0];
    [0, 0, 1, 1];
];
B = [8, 10, 3]';

% general problem
result = simplex(A, B, C);


% custom problem
% B = [8, 1, 5];
% result = simplex(A, B, C);