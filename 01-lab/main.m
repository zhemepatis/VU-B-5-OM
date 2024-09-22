clearvars, clc, close all

% Declaring function
interest_left_end = 0;
interest_right_end = 10;
x0 = 5;

f = @(x) ((x.^2 - 1).^2) / 5 - 1;
bisection_method_x_values = bisection_method(f, interest_left_end, interest_right_end);
golden_ratio_method_x_values = golden_ratio_method(f, interest_left_end, interest_right_end);
newton_method_x_values = newton_method(f, x0);

display_bisection_method(f, bisection_method_x_values);
display_golden_ratio_method(f, golden_ratio_method_x_values);
display_newton_method(f, newton_method_x_values);

% Plotting function and selected points 
% figure(1);
% plot_function(f, interest_left_end, interest_right_end);