function selected_points = gradient_descent(init_point, grad_x, grad_y, gamma)
    step_size_threshold = 0.001;
    step_size = inf;
    
    curr_point = init_point;
    
    x_values = [curr_point(1)];
    y_values = [curr_point(2)];

    while step_size > step_size_threshold
        x_val = curr_point(1);
        y_val = curr_point(2);
    
        next_x_val = x_val - gamma * grad_x(x_val, y_val);
        next_y_val = y_val - gamma * grad_y(x_val, y_val);
        
        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
        
        x_values = [x_values, next_x_val];
        y_values = [y_values, next_y_val];
    
        curr_point = [next_x_val, next_y_val];
    end

    selected_points = [x_values; y_values];
end