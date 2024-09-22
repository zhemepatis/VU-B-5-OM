function display_newton_method(f, selected_points)
    x_min = selected_points(end);
    y_min = f(x_min);

    % Displaying results
    disp("NEWTON METHOD");
    disp("x_min: " + x_min); 
    disp("y_min: " + y_min);
end