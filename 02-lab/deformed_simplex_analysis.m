%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

%% defining objective function and its gradient
f = @(x, y) (y.*x.^2 + x.*y.^2 - x.*y)/8;
grad_x = @(x, y) (2*x.*y + y.^2 - y)/8;
grad_y = @(x, y) (x.^2 + 2*x.*y - x)/8;

%% deformed simplex method analysis
alfa = 0.8;

% when initial point is (0; 0)
initial_point = [0, 0];
results = deformed_simplex(f, initial_point, alfa, 2);
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

% plotting
figure(1);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
hold off;


% % when initial point is (1; 1)
initial_point = [1, 1];
results = deformed_simplex(f, initial_point, alfa, 2)
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

% plotting
figure(2);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
hold off;


%% when initial point is (0.1; 0.5)
initial_point = [1/10, 5/10];
results = deformed_simplex(f, initial_point, alfa, 2)
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);

% plotting
figure(3);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
hold off;

