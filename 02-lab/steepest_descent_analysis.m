%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

%% defining objective function and its gradient
f = @(x, y) (y.*x.^2 + x.*y.^2 - x.*y)/8;
grad_x = @(x, y) (2*x.*y + y.^2 - y)/8;
grad_y = @(x, y) (x.^2 + 2*x.*y - x)/8;

%% steepest descent method analysis
% when initial point is (0; 0)
initial_point = [0, 0];
results = steepest_descent(f, initial_point, grad_x, grad_y);
x_values = results(1, :);
y_values = results(2, :);
disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(f(x_values(end), y_values(end))));

% plotting
figure(2);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, f(x_values, y_values), 'filled', 'MarkerFaceColor', 'r'); 
hold off;


% when initial point is (1; 1)
initial_point = [1, 1];
results = steepest_descent(f, initial_point, grad_x, grad_y);
x_values = results(1, :);
y_values = results(2, :);
disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(f(x_values(end), y_values(end))));

% plotting
figure(3);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, f(x_values, y_values), 'filled', 'MarkerFaceColor', 'r'); 
hold off;


% when initial point is (0.1; 0.5)
initial_point = [1/10, 5/10];
results = steepest_descent(f, initial_point, grad_x, grad_y);
x_values = results(1, :);
y_values = results(2, :);
disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(f(x_values(end), y_values(end))));

% plotting
figure(4);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, f(x_values, y_values), 'filled', 'MarkerFaceColor', 'r'); 
hold off;

