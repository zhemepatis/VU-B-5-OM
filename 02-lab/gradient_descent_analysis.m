%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

%% defining objective function and its gradient
f = @(x, y) (y.*x.^2 + x.*y.^2 - x.*y)/8;
grad_x = @(x, y) (2*x.*y + y.^2 - y)/8;
grad_y = @(x, y) (x.^2 + 2*x.*y - x)/8;

%% gradient descent method analysis
gamma = 2.66666;

% when initial point is (0; 0)
initial_point = [0, 0];
[iterations, func_calls, results] = gradient_descent(initial_point, grad_x, grad_y, gamma);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = f(x_values, y_values);

x_min = x_values(end);
y_min = y_values(end);
z_min = z_values(end);

% Displaying results
disp("GRADIENT DESCENT METHOD");
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + z_min);
disp("----------------")
disp("Iterations: " + iterations);
disp("Function calls: " + func_calls);
disp(newline);

% plotting
figure(1);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
graph = plot3(x_values, y_values, f(x_values, y_values));
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

x_min = x_values(end);
y_min = y_values(end);
graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;


%when initial point is (1; 1)
initial_point = [1, 1];
[iterations, func_calls, results] = gradient_descent(initial_point, grad_x, grad_y, gamma);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = f(x_values, y_values);

x_min = x_values(end);
y_min = y_values(end);
z_min = z_values(end);

% Displaying results
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + z_min);
disp("----------------")
disp("Iterations: " + iterations);
disp("Function calls: " + func_calls);
disp(newline);

% plotting
figure(2);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
graph = plot3(x_values, y_values, f(x_values, y_values));
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

x_min = x_values(end);
y_min = y_values(end);
graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;


% when initial point is (0.1; 0.5)
initial_point = [1/10, 5/10];
[func_calls, iterations, results] = gradient_descent(initial_point, grad_x, grad_y, gamma);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = f(x_values, y_values);

x_min = x_values(end);
y_min = y_values(end);
z_min = z_values(end);

% Displaying results
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + z_min);
disp("----------------")
disp("Iterations: " + iterations);
disp("Function calls: " + func_calls);
disp(newline);

% plotting
figure(3);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
graph = plot3(x_values, y_values, f(x_values, y_values));
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

x_min = x_values(end);
y_min = y_values(end);
graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;

