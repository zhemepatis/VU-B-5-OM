function plot_function(f)
    hold on;
    graph = fplot(f);
    graph.Color = '#07bdfa';
    graph.LineStyle = '-';
    graph.LineWidth = 1.8;
    graph.DisplayName = "f(x)";
    hold off
end