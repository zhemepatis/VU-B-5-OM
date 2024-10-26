function plot_selected_points(f, selected_points, color)
    hold on;
    graph = scatter(selected_points, f(selected_points), "filled"); 
    graph.MarkerFaceColor = color;
    hold off;
end