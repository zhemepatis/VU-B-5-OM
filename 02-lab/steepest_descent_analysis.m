%% Variable clean up, closing figures
clearvars; clc; close all;

addpath("utilities");

%% defining objective function and its gradient
f = @(x, y) (y.*x.^2 + x.*y.^2 - x.*y)/8;
grad = @(x, y) [(2*x.*y + y.^2 - y)/8, (x.^2 + 2*x.*y - x)/8];

% steepest descent method analysis
% when initial point is (0; 0)
initial_point = [0, 0];
[iterations, func_calls, gammas, results] = steepest_descent(f, initial_point, grad);
write_intermediate_values([results, gammas], "output/excel/steepest_descent_method_0_0.xlsx");
x_values = results(:, 1)';
y_values = results(:, 2)';

x_min = x_values(end);
y_min = y_values(end);

% Displaying results
disp("STEEPEST DESCENT METHOD");
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + f(x_min, y_min));
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
graph.DisplayName = "Metodo trajektorija";

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

x_min = x_values(end);
y_min = y_values(end);
graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;


% when initial point is (1; 1)
initial_point = [1, 1];
[iterations, func_calls, gammas, results] = steepest_descent(f, initial_point, grad);
write_intermediate_values([results, gammas], "output/excel/steepest_descent_method_1_1.xlsx");
x_values = results(:, 1)';
y_values = results(:, 2)';

x_min = x_values(end);
y_min = y_values(end);

% Displaying results
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + f(x_min, y_min));
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
graph.DisplayName = "Metodo trajektorija";

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;


% when initial point is (0.1; 0.5)
initial_point = [1/10, 5/10];
[iterations, func_calls, gammas, results] = steepest_descent(f, initial_point, grad);
write_intermediate_values([results, gammas], "output/excel/steepest_descent_method_custom_point.xlsx");
x_values = results(:, 1)';
y_values = results(:, 2)';

x_min = x_values(end);
y_min = y_values(end);

% Displaying results
disp("----------------")
disp("x_min: " + x_min); 
disp("y_min: " + y_min);
disp("z_min: " + f(x_min, y_min));
disp("----------------")
disp("Iterations: " + iterations);
disp("Function calls: " + func_calls);

% plotting
figure(3);
prep_for_3d_plot([-0.1, 1.1], [-0.1, 1.1], [-0.1, 1.1]);
plot_3d_function(f);

hold on;
graph = plot3(x_values, y_values, f(x_values, y_values));
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;
graph.DisplayName = "Metodo trajektorija";

graph = scatter3(x_values, y_values, f(x_values, y_values), "filled");
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

graph = scatter3(x_min, y_min, f(x_min, y_min), "filled");
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;