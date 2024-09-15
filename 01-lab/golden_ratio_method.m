clearvars, clc, close all

% Declaring function
focus_left_end = 0;
focus_right_end = 10;

a = 1;
b = 5;
func = @(x) ((x.^2 - a).^2) / (b - 1);

% Method precision (when to stop)
precision = 10^(-4);

% Initial values
fibonacci_num = (-1 + sqrt(5)) / 2;
left_end = focus_left_end;
right_end = focus_right_end;
interval_length = right_end - left_end;
x1 = right_end - fibonacci_num * interval_length;
x2 = left_end + fibonacci_num * interval_length;

% Preparation for plotting graphs
x1_list = [];
x2_list = [];

while interval_length > precision
    % Saving values for plotting
    x1_list = [x1_list, x1];
    x2_list = [x2_list, x2];

    % Preparing y values 
    y1 = func(x1);
    y2 = func(x2);

    if y2 < y1
        left_end = x1;
        interval_length = right_end - left_end;
        x1 = x2;
        x2 = left_end + fibonacci_num * interval_length;
    else
        right_end = x2;
        interval_length = right_end - left_end;
        x2 = x1;
        x1 = right_end - fibonacci_num * interval_length;
    end
end

% Results
ans_x = xm;
ans_y = func(xm);

%% Plotting
figure(1);

% Plotting graph
graph_x = linspace(focus_left_end, focus_right_end, 100000);

approx_graph = plot(graph_x, func(graph_x)); hold on;
approx_graph.Color = '#07bdfa';
approx_graph.LineStyle = '-';
approx_graph.LineWidth = 1.5;

% Plotting selected points
selected_points_graph = plot(x1_list, func(x1_list)); hold on;
selected_points_graph.Color = '#404dff';
selected_points_graph.LineStyle = "none";
selected_points_graph.Marker = '.';
selected_points_graph.MarkerSize = 20;

selected_points_graph = plot(x2_list, func(x2_list)); hold on;
selected_points_graph.Color = '#404dff';
selected_points_graph.LineStyle = "none";
selected_points_graph.Marker = '.';
selected_points_graph.MarkerSize = 20;

grid on;

Iteration = [];
iteration_num = length(x1_list);
for i = 1:iteration_num
    curr_iteration = '';
    if i < 10
        curr_iteration = ['0', num2str(i)];
    else
        curr_iteration = num2str(i);
    end

    iteration_name = ['Iteration no. ', curr_iteration];
    Iteration = [Iteration; iteration_name];
end

points_table = table(Iteration, x1_list', x2_list');
filename = 'golden_ratio_method_results.xlsx';
writetable(points_table, filename)