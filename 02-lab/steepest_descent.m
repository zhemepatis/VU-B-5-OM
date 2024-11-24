function [iterations, func_calls, gammas, intermediate_values] = steepest_descent(f, initial_point, grad, gamma_range)
    step_threshold = 0.0001;
    max_iterations = 100; % protection in case we fall into pit that goes to infty

    gammas = -1;
    intermediate_values = initial_point;
    x_val = initial_point(1);
    y_val = initial_point(2);

    step_size = inf;
    func_calls = 1; % one more function call is needed tin the end when getting value in min point
    iterations = 1;
    while step_size > step_threshold && iterations < max_iterations
        curr_grad = grad(x_val, y_val);
        func_calls = func_calls + 2;
        grad_norm = sqrt(curr_grad(1)^2 + curr_grad(2)^2);
        if grad_norm == 0
            iterations = iterations + 1;
            break;
        end

        grad_x_val = - curr_grad(1);
        grad_y_val = - curr_grad(2);

        grad_x_val = grad_x_val / grad_norm;
        grad_y_val = grad_y_val / grad_norm;

        gamma_func = @(gamma) f(x_val + gamma * grad_x_val, y_val + gamma * grad_y_val);      
        [~, grm_func_calls, grm_results] = golden_ratio_method(gamma_func, gamma_range(1), gamma_range(2));
        func_calls = func_calls + grm_func_calls;
        gamma = grm_results(end, 3);
        
        next_x_val = x_val + gamma*grad_x_val;
        next_y_val = y_val + gamma*grad_y_val;
        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2);
        
        x_val = next_x_val;
        y_val = next_y_val;
        
        intermediate_values = [intermediate_values; x_val, y_val];
        gammas = [gammas; gamma];
        iterations = iterations + 1;
    end
end