clearvars, clc, close all

% Declaring function
interest_left_end = 0;
interest_right_end = 10;

f = @(x) ((x.^2 - 1).^2) / 5 - 1;
[xm, ym] = newton_method(f, 5);

% Results
disp("x_m: " + xm);
disp("y_m: " + ym);