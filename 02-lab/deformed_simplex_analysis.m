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
results = deformed_simplex(f, initial_point, alfa, 0.5)
x_values = results(:, 1);
y_values = results(:, 2);
z_values = results(:, 3);
% mid_points = [0.4899, 0.489; 0.5088, 0.2260; 0.3014, 0.2307];
disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(z_values(end)));

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

plot_simplex(f, results(7:9, :), '#000');
scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r');
% scatter3(mid_points(:, 1), mid_points(:, 2), f(mid_points(:, 1), mid_points(:, 2)), "filled");
hold off;


% % when initial point is (1; 1)
% initial_point = [1, 1];
% results = deformed_simplex(f, initial_point, alfa, 2);
% x_values = results(:, 1);
% y_values = results(:, 2);
% z_values = results(:, 3);
% disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(z_values(end)));

% % plotting
% figure(2);
% prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
% plot_3d_function(f);

% hold on;
% plot_simplex(f, results(1:3, :), '#07bdfa');
% plot_simplex(f, results(4:7, :), '#07bdfa');
% plot_simplex(f, results(8:11, :), '#07bdfa');
% plot_simplex(f, results(12:15, :), '#07bdfa');
% scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
% hold off;


% %% when initial point is (0.1; 0.5)
% initial_point = [1/10, 5/10];
% results = deformed_simplex(f, initial_point, alfa, 2);
% x_values = results(:, 1);
% y_values = results(:, 2);
% z_values = results(:, 3);
% disp("Result: x = " + num2str(x_values(end)) + ", y = " + num2str(y_values(end)) + ", z = " + num2str(z_values(end)));

% % plotting
% figure(3);
% prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
% plot_3d_function(f);

% hold on;
% plot_simplex(f, results(1:3, :), '#07bdfa');
% plot_simplex(f, results(4:7, :), '#07bdfa');
% plot_simplex(f, results(8:11, :), '#07bdfa');
% plot_simplex(f, results(12:15, :), '#07bdfa');
% scatter3(x_values, y_values, z_values, 'filled', 'MarkerFaceColor', 'r'); 
% hold off;

