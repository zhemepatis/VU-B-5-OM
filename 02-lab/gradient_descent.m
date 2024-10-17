function selected_points = gradient_descent(init_point, grad_x, grad_y, gamma)
    step_size_threshold = 0.001;
    step_size = inf;
    
    x_values = [init_point(1)];
    y_values = [init_point(2)];

    while step_size > step_size_threshold
        x_val = x_values(end);
        y_val = y_values(end);
    
        next_x_val = x_val - gamma * grad_x(x_val, y_val);
        next_y_val = y_val - gamma * grad_y(x_val, y_val);
        
        x_values = [x_values, next_x_val];
        y_values = [y_values, next_y_val];

        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
    end

    selected_points = [x_values; y_values];
end