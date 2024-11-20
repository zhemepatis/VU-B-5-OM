function intermediate_values = penalty_method(init_point, r, iteration_count, grad, gamma, epsilon)
    iteration = 0; 
    intermediate_values = [];
    while iteration < iteration_count
        [gradient_iterations, gradient_func_calls, results] = gradient_descent(init_point, r, grad, gamma, epsilon);
        intermediate_values = [intermediate_values; r, results(end, :), gradient_iterations, gradient_func_calls];
        
        r = r / 2;
        gamma = gamma / 10;
        init_point = results(end, :);
        iteration = iteration + 1;
    end
end