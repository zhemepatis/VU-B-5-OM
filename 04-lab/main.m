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
[min_value, coords, basis, intermediate_values]  = simplex(A, B, C);
disp("GENERAL PROBLEM RESULTS")
disp("=======================")
disp("coordinates: " + mat2str(coords));
disp("f_min: " + min_value);
disp("basis: " + mat2str(basis));
disp(newline)


% custom problem
B = [8, 1, 5]';
[min_value, coords, basis, intermediate_values]  = simplex(A, B, C);

disp("CUSTOM PROBLEM RESULTS")
disp("======================")
disp("coordinates: " + mat2str(coords));
disp("f_min: " + min_value);
disp("basis: " + mat2str(basis));
disp(newline)