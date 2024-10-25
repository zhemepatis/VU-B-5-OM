clearvars, clc, close all

% Adding paths
addpath("display");
addpath("plot");

% Declaring function
interest_left_end = 0;
interest_right_end = 10;
x0 = 5;

f = @(x) ((x.^2 - 1).^2) / 5 - 1;

% bisection method
bisection_method_values = bisection_method(f, interest_left_end, interest_right_end);
display_bisection_method(f, bisection_method_values);
write_intermediate_values(bisection_method_values, "results/excel/bisection_method.xlsx");

% plotting
x_values = bisection_method_values(:, 3);

figure(1);
plot_function(f, interest_left_end, interest_right_end);
plot_bisection_method_points(f, x_values);

% golden_ratio_method_x_values = golden_ratio_method(f, interest_left_end, interest_right_end);
% newton_method_x_values = newton_method(f, x0);


% display_golden_ratio_method(f, golden_ratio_method_x_values);
% display_newton_method(f, newton_method_x_values);

% figure(3);
% plot_function(f, interest_left_end, interest_right_end);
% plot_golden_ratio_method_points(f, golden_ratio_method_x_values);

% figure(4);
% plot_function(f, interest_left_end, interest_right_end);
% plot_selected_points(f, newton_method_x_values);