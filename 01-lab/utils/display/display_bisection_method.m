function display_bisection_method(f, intermediate_values)
    x_min = intermediate_values(end, 3);
    y_min = f(x_min);
    
    iterations = size(intermediate_values, 1);
    func_calls = (iterations - 1) * 2 + 1;

    % Displaying results
    disp("BISECTION METHOD");
    disp("----------------")
    disp("x_min: " + x_min); 
    disp("y_min: " + y_min);
    disp("----------------")
    disp("Iterations: " + iterations);
    disp("Function calls: " + func_calls);
end