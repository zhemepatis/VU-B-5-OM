%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

f = @(x, y) -(x .* y - x.^2 .* y - x .* y.^2) / 8;
grad_x = @(x, y) -(y - 2 * x .* y - y.^2);
grad_y = @(x, y) -(x - x.^2 - 2 * x .* y);

args = [1, 1];
gamma = 0.1;
x_values = args(1); 
y_values = args(2); 

step_size_threshold = 0.001;
step_size = inf;

while step_size > step_size_threshold
    x_val = args(1);
    y_val = args(2);

    next_x_val = x_val - gamma * grad_x(x_val, y_val);
    next_y_val = y_val - gamma * grad_y(x_val, y_val);
    
    step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
    
    x_values = [x_values, next_x_val];
    y_values = [y_values, next_y_val];

    args = [next_x_val, next_y_val];
end

% Plotting
figure(1);
prep_for_3d_plot([-0.5, 1.5], [-0.5, 1.5], [-1.5, 0.5]);
plot_3d_function(f);

hold on;
graph = scatter3(x_values, y_values, f(x_values, y_values), 'filled', 'MarkerFaceColor', 'r'); 
hold off;
