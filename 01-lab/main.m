clearvars, clc, close all

% Adding paths
addpath("display");
addpath("plot");
addpath("write");

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
figure(1);
plot_function(f, -10, 10);

figure(2);
plot_function(f, interest_left_end, interest_right_end);
plot_selected_points(f, bisection_method_x_values);

figure(3);
plot_function(f, interest_left_end, interest_right_end);
plot_selected_points(f, golden_ratio_method_x_values);

figure(4);
plot_function(f, interest_left_end, interest_right_end);
plot_selected_points(f, newton_method_x_values);

% Writing selected points to excel
write_bisection_method(bisection_method_x_values);
write_golden_ratio_method(bisection_method_x_values);
write_newton_method(newton_method_x_values);