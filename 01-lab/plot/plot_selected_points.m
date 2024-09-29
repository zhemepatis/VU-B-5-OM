function plot_selected_points(f, selected_points)
    graph = scatter(selected_points, f(selected_points), "filled"); hold on;
    graph.MarkerFaceColor = '#404DFF';

    legend([graph], {'x_i'})
end