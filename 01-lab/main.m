clearvars, clc, close all

% Adding paths
addpath("utils");
addpath("display");
addpath("plot");

% Declaring function
f = @(x) ((x.^2 - 1).^2) / 5 - 1;

interest_left_end = 0;
interest_right_end = 10;

%% BISECTION METHOD
bisection_method_values = bisection_method(f, interest_left_end, interest_right_end);
display_bisection_method(f, bisection_method_values);
disp(newline);
write_intermediate_values(bisection_method_values, "results/excel/bisection_method.xlsx");

% TODO: plotting
% x_values = bisection_method_values(:, 3);

% figure(1);
% plot_function(f, interest_left_end, interest_right_end);
% plot_bisection_method_points(f, x_values);


%% GOLDEN RATIO METHOD
golden_ratio_method_values = golden_ratio_method(f, interest_left_end, interest_right_end);
display_golden_ratio_method(f, golden_ratio_method_values);
disp(newline);
write_intermediate_values(golden_ratio_method_values, "results/excel/golden_ratio_method.xlsx");

% TODO: plotting 
% figure(2);
% plot_function(f, interest_left_end, interest_right_end);
% plot_golden_ratio_method_points(f, x_values);


%% NEWTON METHOD
x_0 = 5;
newton_method_values = newton_method(f, x_0);
display_newton_method(f, newton_method_values);
write_intermediate_values(newton_method_values', "results/excel/newton_method.xlsx");

% plotting 
figure(3);
prep_for_plot([-0.25, 2.5], [-1.25, 1.25]);
plot_function(f, interest_left_end, interest_right_end);
plot_selected_points(f, newton_method_values);