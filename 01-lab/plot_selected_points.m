function plot_selected_points(f, selected_points)
    graph = plot(selected_points, f(selected_points)); hold on;
    graph.Color = '#404dff';
    graph.LineStyle = "none";
    graph.Marker = '.';
    graph.MarkerSize = 20;
end