function plot_simplex(f, points, color)
    points(4, :) = points(1, :);
    x_values = points(:, 1);
    y_values = points(:, 2);

    graph = plot3(x_values, y_values, f(x_values, y_values));
    graph.Color = color;
    graph.LineWidth = 1.8;
    graph.HandleVisibility = "off";
end