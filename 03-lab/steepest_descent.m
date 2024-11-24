function [iterations, func_calls, gammas, intermediate_values] = steepest_descent(f, initial_point, r, grad, max_gamma, epsilon)
    max_iterations = 100; % protection in case we fall into pit that goes to infinity

    gammas = -1;
    intermediate_values = initial_point;
    x_val = initial_point(1);
    y_val = initial_point(2);
    z_val = initial_point(3);

    step_size = inf;
    func_calls = 1; % one more function call is needed tin the end when getting value in min point
    iterations = 1;
    while step_size > epsilon && iterations < max_iterations
        curr_grad = grad(x_val, y_val, z_val, r);
        func_calls = func_calls + 2;

        grad_norm = norm(curr_grad);
        if grad_norm == 0
            iterations = iterations + 1;
            break;
        end

        direction = - curr_grad / grad_norm;

        gamma_func = @(gamma) f(x_val + gamma * direction(1), y_val + gamma * direction(2), z_val + gamma * direction(3), r);      
        [~, grm_func_calls, grm_results] = golden_ratio_method(gamma_func, 0, max_gamma, epsilon);
        func_calls = func_calls + grm_func_calls;
        gamma = grm_results(end, 3);
        
        next_x_val = x_val + gamma*direction(1);
        next_y_val = y_val + gamma*direction(2);
        next_z_val = z_val + gamma*direction(3);
        step_size = sqrt((next_x_val - x_val)^2 + (next_y_val - y_val)^2 + (next_z_val - z_val)^2);
        
        x_val = next_x_val;
        y_val = next_y_val;
        z_val = next_z_val;
        
        intermediate_values = [intermediate_values; x_val, y_val, z_val];
        gammas = [gammas; gamma];
        iterations = iterations + 1;
    end
end