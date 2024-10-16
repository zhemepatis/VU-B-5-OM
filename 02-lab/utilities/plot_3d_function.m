function plot_3d_function(f)
    x_values = -0:0.05:1.1;
    y_values = x_values';

    hold on; 

    xlabel('x');
    ylabel('y');

    % plotting given function
    graph = contour3(x_values, y_values, f(x_values, y_values), "EdgeColor", 'b');

    grid on; 
    hold off;
end