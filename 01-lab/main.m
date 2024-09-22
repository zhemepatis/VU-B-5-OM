clearvars, clc, close all

% Declaring function
interest_left_end = 0;
interest_right_end = 10;
x0 = 5;

f = @(x) ((x.^2 - 1).^2) / 5 - 1;
[bisection_method_xm, bisection_method_ym] = bisection_method(f, interest_left_end, interest_right_end);
[golden_ratio_method_xm, golden_ratio_method_ym] = golden_ratio_method(f, interest_left_end, interest_right_end);
[newton_method_xm, newton_method_ym] = newton_method(f, x0);

% Results
disp("BISECTION METHOD");
disp("x_m: " + bisection_method_xm); 
disp("y_m: " + bisection_method_ym);

disp("GOLDEN RATIO METHOD");
disp("x_m: " + golden_ratio_method_xm); 
disp("y_m: " + golden_ratio_method_ym);

disp("NEWTON METHOD");
disp("x_m: " + newton_method_xm); 
disp("y_m: " + newton_method_ym);