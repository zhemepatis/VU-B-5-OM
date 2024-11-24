function [iterations, func_calls, intermediate_values] = golden_ratio_method(f, interest_left_end, interest_right_end)
    precision = 10^(-4); % Method precision (when to stop)

    fibonacci_num = (-1 + sqrt(5)) / 2;
    
    % Initial values
    left_end = interest_left_end;
    right_end = interest_right_end;
    interval_length = right_end - left_end;

    x1 = right_end - fibonacci_num * interval_length;
    y1 = f(x1);
    x2 = left_end + fibonacci_num * interval_length;
    y2 = f(x2);

    iterations = 1;
    func_calls = 2;
    intermediate_values = [left_end, x1, x2, right_end];
    while interval_length > precision
        if y2 < y1
            left_end = x1;
            interval_length = right_end - left_end;

            x1 = x2;
            y1 = y2;
            
            x2 = left_end + fibonacci_num * interval_length;
            y2 = f(x2);
            func_calls = func_calls + 1;
        else
            right_end = x2;
            interval_length = right_end - left_end;
            
            x2 = x1;
            y2 = y1;

            x1 = right_end - fibonacci_num * interval_length;
            y1 = f(x1);
            func_calls = func_calls + 1;
        end

        intermediate_values = [intermediate_values; left_end, x1, x2, right_end];
        iterations = iterations + 1;
    end
end