function display_golden_ratio_method(f, selected_points)
    last_x1 = selected_points(end - 1);
    last_x2 = selected_points(end);
    x_min = (last_x1 + last_x2) / 2;
    y_min = f(x_min);

    % Displaying results
    disp("GOLDEN RATIO METHOD");
    disp("x_min: " + x_min); 
    disp("y_min: " + y_min);
end