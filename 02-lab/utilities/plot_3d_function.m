function plot_3d_function(f)
    x_values = 0:0.05:2;
    y_values = x_values';

    hold on; 

    xlabel('x');
    ylabel('y');

    % plotting given function
    graph = surf(x_values, y_values, f(x_values, y_values));

    grid on; 
    hold off;
end