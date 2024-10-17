function min_gamma = bisection_method(func, args, grad, interest_left_end, interest_right_end)
    % defining function
    f = @(gamma) func(args(1)+gamma*grad(1), args(2)+gamma*grad(2));
    
    step_threshold = 0.8;

    % initial values
    left_end = interest_left_end;
    right_end = interest_right_end;
    interval_length = right_end - left_end;
    xm = (left_end + right_end) / 2;
    ym = f(xm);

    iterations = 0;
    func_calls = 1;
    while interval_length > step_threshold
        iterations = iterations + 1;
        func_calls = func_calls + 2;

        x1 = left_end + interval_length / 4;
        x2 = right_end - interval_length / 4;

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
    min_gamma = xm;
end