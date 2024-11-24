function intermediate_values = penalty_method(f, init_point, r, r_coef, iteration_count, grad, gamma, epsilon)
    iteration = 0; 
    intermediate_values = [];
    while iteration < iteration_count
        [sdm_iterations, sdm_func_calls, ~, results] = steepest_descent(f, init_point, r, grad, gamma, epsilon, 40);
        intermediate_values = [intermediate_values; r, results(end, :), sdm_iterations, sdm_func_calls];
        
        r = r * r_coef;
        % gamma = gamma / 2;
        epsilon = max(10^(-4), epsilon / 10);
        
        init_point = results(end, :);
        iteration = iteration + 1;
    end
end