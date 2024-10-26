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

% plotting
figure(1);
prep_for_plot([-0.1, 1.6], [-1.5, 0.2]);

hold on;


hold off;


% x_values = bisection_method_values(:, 3);

% figure(1);
% plot_function(f, interest_left_end, interest_right_end);
% plot_bisection_method_points(f, x_values);


%% GOLDEN RATIO METHOD
golden_ratio_method_values = golden_ratio_method(f, interest_left_end, interest_right_end)
display_golden_ratio_method(f, golden_ratio_method_values);
disp(newline);
write_intermediate_values(golden_ratio_method_values, "results/excel/golden_ratio_method.xlsx");

% plotting
figure(2);
prep_for_plot([0.6, 1.6], [-1.4, -0.4]);

hold on;
graph = fplot(f);
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;
graph.DisplayName = "f(x)";

x_values = [golden_ratio_method_values(:, 2)', golden_ratio_method_values(:, 3)'];
graph = scatter(x_values, f(x_values), "filled"); 
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

x_values = (golden_ratio_method_values(end, 2) + golden_ratio_method_values(end, 3))/2;
graph = scatter(x_values, f(x_values), "filled"); 
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";
hold off;


%% NEWTON METHOD
x_0 = 5;
newton_method_values = newton_method(f, x_0);
display_newton_method(f, newton_method_values);
write_intermediate_values(newton_method_values', "results/excel/newton_method.xlsx");

% plotting 
figure(3);
prep_for_plot([0.8, 1.8], [-1.3, -0.3]);

hold on;
graph = fplot(f);
graph.Color = '#07bdfa';
graph.LineStyle = '-';
graph.LineWidth = 1.8;
graph.DisplayName = "f(x)";

graph = scatter(newton_method_values, f(newton_method_values), "filled"); 
graph.MarkerFaceColor = '#404DFF';
graph.DisplayName = "Tarpiniai taškai";

graph = scatter(newton_method_values(end), f(newton_method_values(end)), "filled"); 
graph.MarkerFaceColor = '#E57373';
graph.DisplayName = "Minimumo taškas";

hold off;