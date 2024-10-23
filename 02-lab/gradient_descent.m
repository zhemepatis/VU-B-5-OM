function selected_points = gradient_descent(init_point, grad_x, grad_y, gamma)
    step_size_threshold = 0.0001;
    step_size = inf;
    
    x_values = [init_point(1)];
    y_values = [init_point(2)];

    iterations = 0;
    function_calls = 1; % one more function call is needed tin the end when getting value in min point

    while step_size > step_size_threshold
        x_val = x_values(end);
        y_val = y_values(end);
    
        next_x_val = x_val - gamma * grad_x(x_val, y_val);
        next_y_val = y_val - gamma * grad_y(x_val, y_val);
        function_calls = function_calls + 2;
        
        x_values = [x_values, next_x_val];
        y_values = [y_values, next_y_val];

        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
        iterations = iterations + 1;
    end

    selected_points = [x_values; y_values];

    disp("Iterations: " + num2str(iterations));
    disp("Function calls: " + num2str(function_calls));
end