function display_newton_method(f, intermediate_values)
    x_min = intermediate_values(end);
    y_min = f(x_min);

    iterations = length(intermediate_values);
    func_calls = iterations * 2 - 2;

    % Displaying results
    disp("NEWTON METHOD");
    disp("----------------")
    disp("x_min: " + x_min); 
    disp("y_min: " + y_min);
    disp("----------------")
    disp("Iterations: " + iterations);
    disp("Function calls: " + func_calls);
end