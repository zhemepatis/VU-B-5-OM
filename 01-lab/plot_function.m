function plot_function(f, interest_left_end, interest_right_end)
    x_values = interest_left_end:0.001:interest_right_end;

    % plotting axes
    xline(0); hold on; 
    yline(0); hold on;

    % plotting given function
    graph = plot(x_values, f(x_values)); hold on;
    graph.Color = '#07bdfa';
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;

    grid on;
end