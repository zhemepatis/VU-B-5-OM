function plot_3d_function(f)
    x_values = 0:0.05:1.1;
    y_values = x_values;
    
    [X, Y] = meshgrid(x_values, y_values);
    Z = f(X, Y);
    
    hold on; 
    contour3(X, Y, Z);
    legend("Tikslo funkcija");
    grid on; 
    
    hold off;
end
