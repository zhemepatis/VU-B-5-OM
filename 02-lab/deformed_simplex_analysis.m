%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

%% defining objective function and its gradient
f = @(x, y) (y.*x.^2 + x.*y.^2 - x.*y)/8;
grad_x = @(x, y) (2*x.*y + y.^2 - y)/8;
grad_y = @(x, y) (x.^2 + 2*x.*y - x)/8;

% parameters
shrink_coef = 0.5;

%% when initial point is (0; 0)
initial_point = [0, 0];
[iterations, func_calls, results] = deformed_simplex(f, initial_point, 0.4, shrink_coef);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

x_min = x_values(end);
y_min = y_values(end);
z_min = z_values(end);

% Displaying results
disp("DEFORMED SIMPLEX METHOD");
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
simplex_count = size(results, 1) / 3;
for idx = 1:simplex_count
    simplex_start = 3*(idx - 1) + 1;
    simplex_end = simplex_start + 2;
    plot_simplex(f, results(simplex_start:simplex_end, :), '#07bdfa');
end
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r');
hold off;


%% when initial point is (1; 1)
initial_point = [1, 1];
[iterations, func_calls, results] = deformed_simplex(f, initial_point, -0.37, shrink_coef);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

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
simplex_count = size(results, 1) / 3;
for idx = 1:simplex_count
    simplex_start = 3*(idx - 1) + 1;
    simplex_end = simplex_start + 2;
    plot_simplex(f, results(simplex_start:simplex_end, :), '#07bdfa');
end
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
hold off;


%% when initial point is (0.1; 0.5)
initial_point = [1/10, 5/10];
[iterations, func_calls, results] = deformed_simplex(f, initial_point, -0.3, shrink_coef);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

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
simplex_count = size(results, 1) / 3;
for idx = 1:simplex_count
    simplex_start = 3*(idx - 1) + 1;
    simplex_end = simplex_start + 2;
    plot_simplex(f, results(simplex_start:simplex_end, :), '#07bdfa');
end
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
hold off;

