function intermediate_values = steepest_descent(f, initial_point, grad_x, grad_y)
    step_threshold = 0.0001;
    max_iterations = 100; % protection in case we fall into pit that goes to infty

    x_val = initial_point(1);
    y_val = initial_point(2);

    gamma = inf;
    intermediate_values = [initial_point, 0];
    while gamma > step_threshold
        grad_x_val = - grad_x(x_val, y_val);
        grad_y_val = - grad_y(x_val, y_val);
        if grad_x_val == 0 && grad_y_val == 0
            break
        end
        gradient_norm = sqrt(grad_x_val^2 + grad_y_val^2);

        grad_x_val = grad_x_val / gradient_norm;
        grad_y_val = grad_y_val / gradient_norm;

        gamma_func = @(gamma) f(x_val + gamma * grad_x_val, y_val + gamma * grad_y_val);
        bm_results = bisection_method(gamma_func, 0, 0.5);
        gamma = bm_results(end, 3);
        iterations = size(bm_results, 1);
        func_calls = (iterations - 1) * 2 + 1;

        x_val = x_val + gamma*grad_x_val;
        y_val = y_val + gamma*grad_y_val;

        intermediate_values = [intermediate_values; x_val, y_val, func_calls];

        if size(intermediate_values, 1) == max_iterations
            intermediate_values = [];
            break
        end
    end
end