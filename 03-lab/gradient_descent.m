function [iterations, func_calls, intermediate_values] = gradient_descent(init_point, r, grad, gamma, epsilon)
    grad_norm = inf;
    
    intermediate_values = init_point;
    x_val = init_point(1);
    y_val = init_point(2);
    z_val = init_point(3);

    iterations = 1;
    func_calls = 0; % one more function call is needed in the end when getting value in min point
    while grad_norm > epsilon
        curr_grad = grad(x_val, y_val, z_val, r);
        func_calls = func_calls + 3;
        
        grad_norm = norm(curr_grad);
        if grad_norm == 0
            iterations = iterations + 1;
            break;
        end

        next_x_val = x_val - gamma * curr_grad(1);
        next_y_val = y_val - gamma * curr_grad(2);
        next_z_val = z_val - gamma * curr_grad(3);

        % step_size = sqrt(curr_grad(1)^2 + curr_grad(2)^2 + curr_grad(3)^2);
        iterations = iterations + 1;
        
        intermediate_values = [intermediate_values; next_x_val, next_y_val, next_z_val]
        x_val = next_x_val;
        y_val = next_y_val;
        z_val = next_z_val;
    end
end