function selected_points = steepest_descent(f, init_point, grad_x, grad_y)
    step_size_threshold = 0.0001;
    step_size = inf;
    
    x_values = [init_point(1)];
    y_values = [init_point(2)];

    iterations = 0;
    function_calls = 1; % one more function call is needed tin the end when getting value in min point

    while step_size > step_size_threshold
        x_val = x_values(end);
        y_val = y_values(end);

        grad_x_val = grad_x(x_val, y_val);
        grad_y_val = grad_y(x_val, y_val);
        function_calls = function_calls + 2;

        [gamma, bm_function_calls] = bisection_method(f, [x_val, y_val], [grad_x_val, grad_y_val], 0, 1);
        function_calls = function_calls + bm_function_calls;
        next_x_val = x_val - gamma*grad_x_val;
        next_y_val = y_val - gamma*grad_y_val;
        
        x_values = [x_values, next_x_val];
        y_values = [y_values, next_y_val];

        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);

        iterations = iterations + 1; 
    end

    selected_points = [x_values; y_values];

    disp("Iterations: " + num2str(iterations));
    disp("Function calls: " + num2str(function_calls));
end