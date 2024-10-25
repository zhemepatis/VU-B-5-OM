function display_golden_ratio_method(f, intermediate_values)
    last_x1 = intermediate_values(end, 1);
    last_x2 = intermediate_values(end, 2);
    
    x_min = (last_x1 + last_x2) / 2;
    y_min = f(x_min);

    iterations = size(intermediate_values, 1);
    func_calls = iterations + 1;

    % Displaying results
    disp("GOLDEN RATIO METHOD");
    disp("----------------")
    disp("x_min: " + x_min); 
    disp("y_min: " + y_min);
    disp("----------------")
    disp("Iterations: " + iterations);
    disp("Function calls: " + func_calls);
end