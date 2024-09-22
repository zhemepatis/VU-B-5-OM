clearvars, clc, close all

% Declaring function
interest_left_end = 0;
interest_right_end = 10;
x0 = 5;

f = @(x) ((x.^2 - 1).^2) / 5 - 1;
bisection_method_x_values = bisection_method(f, interest_left_end, interest_right_end);
golden_ratio_method_x_values = golden_ratio_method(f, interest_left_end, interest_right_end);
newton_method_x_values = newton_method(f, x0);

%% Displaying bisection method results
bisection_method_xmin = bisection_method_x_values(end);
bisection_method_ymin = f(bisection_method_xmin);
disp("BISECTION METHOD");
disp("x_min: " + bisection_method_xmin); 
disp("y_min: " + bisection_method_ymin);

%% Displaying golden ratio method results
golden_ratio_method_xmin = (golden_ratio_method_x_values(end) + golden_ratio_method_x_values(end - 1)) / 2;
golden_ratio_method_ymin = f(golden_ratio_method_xmin);
disp("GOLDEN RATIO METHOD");
disp("x_min: " + golden_ratio_method_xmin); 
disp("y_m: " + golden_ratio_method_ymin);

%% Displaying Newton method results
newton_method_xmin = golden_ratio_method_x_values(end);
newton_method_ymin = f(newton_method_xmin);
disp("NEWTON METHOD");
disp("x_min: " + newton_method_xmin); 
disp("y_min: " + newton_method_ymin);

% Plotting function and selected points 
% figure(1);
% plot_function(f, interest_left_end, interest_right_end);