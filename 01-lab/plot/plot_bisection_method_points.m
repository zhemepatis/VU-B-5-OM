function plot_bisection_method_points(f, selected_points)
    x1_list = selected_points(2:3:end);
    x2_list = selected_points(3:3:end);
    xm_list = selected_points(1:3:end);

    graph_x1 = scatter(x1_list, f(x1_list), "filled"); hold on;
    graph_x1.MarkerFaceColor = '#E57373';
    
    graph_x2 = scatter(x2_list, f(x2_list), "filled"); hold on;
    graph_x2.MarkerFaceColor = '#4DB6AC';
    
    graph_xm = scatter(xm_list, f(xm_list), "filled"); hold on;
    graph_xm.MarkerFaceColor = '#FFB74D';

    legend([graph_x1, graph_x2, graph_xm], {'x1', 'x2', 'xm'})
end