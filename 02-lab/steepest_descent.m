function intermediate_values = steepest_descent(f, initial_point, grad)
    step_threshold = 0.0001;
    max_iterations = 100; % protection in case we fall into pit that goes to infty

    x_val = initial_point(1);
    y_val = initial_point(2);

    step_size = inf;
    intermediate_values = [initial_point, 0];
    while step_size > step_threshold
        curr_grad = grad(x_val, y_val);
        grad_x_val = - curr_grad(1);
        grad_y_val = - curr_grad(2);

        gamma_func = @(gamma) f(x_val + gamma * grad_x_val, y_val + gamma * grad_y_val);      
        bm_results = golden_ratio_method(gamma_func, 0, 4);
        gamma = bm_results(end, 3);
        iterations = size(bm_results, 1);
        func_calls = (iterations - 1) * 2 + 1;

        next_x_val = x_val + gamma*grad_x_val;
        next_y_val = y_val + gamma*grad_y_val;
        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);

        x_val = next_x_val;
        y_val = next_y_val;

        intermediate_values = [intermediate_values; x_val, y_val, func_calls];

        if size(intermediate_values, 1) == max_iterations
            intermediate_values = [];
            break
        end
    end
end