function [iterations, func_calls, intermediate_values] = gradient_descent(init_point, grad_x, grad_y, gamma)
    step_size_threshold = 0.0001;
    step_size = inf;
    
    intermediate_values = init_point;
    x_val = init_point(1);
    y_val = init_point(2);

    iterations = 1;
    func_calls = 1; % one more function call is needed tin the end when getting value in min point
    while step_size > step_size_threshold  
        next_x_val = x_val - gamma * grad_x(x_val, y_val);
        next_y_val = y_val - gamma * grad_y(x_val, y_val);
        func_calls = func_calls + 2;

        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
        iterations = iterations + 1;
        
        intermediate_values = [intermediate_values; next_x_val, next_y_val];
        x_val = next_x_val;
        y_val = next_y_val;
    end
end