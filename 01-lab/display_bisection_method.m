function display_bisection_method(f, selected_points)
    xmin = selected_points(end);
    ymin = f(xmin);

    % Displaying results
    disp("BISECTION METHOD");
    disp("x_min: " + xmin); 
    disp("y_min: " + ymin);
end