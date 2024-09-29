function selected_x_values = bisection_method(f, interest_left_end, interest_right_end)
    precision = 10^(-4); % Method precision (when to stop)
    
    % Initial values
    left_end = interest_left_end;
    right_end = interest_right_end;
    interval_length = right_end - left_end;
    xm = (left_end + right_end) / 2;
    ym = f(xm);

    selected_x_values = [];

    iterations = 0;
    func_calls = 1;
    while interval_length > precision
        iterations = iterations + 1;
        func_calls = func_calls + 2;

        x1 = left_end + interval_length / 4;
        x2 = right_end - interval_length / 4;
        selected_x_values = [selected_x_values, xm, x1, x2];

        y1 = f(x1);
        y2 = f(x2);
    
        if y1 < ym
            right_end = xm;
            xm = x1;
            ym = y1;
        elseif y2 < ym
            left_end = xm;
            xm = x2;
            ym = y2;
        elseif y1 >= ym && y2 >= ym
            left_end = x1;
            right_end = x2;
        end

        interval_length = right_end - left_end;
    end

    disp("Bisection method iterations: " + iterations);
    disp("Bisection method function calls: " + func_calls);

    selected_x_values = [selected_x_values, xm];
end