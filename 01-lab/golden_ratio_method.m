function [xm, ym] = golden_ratio_method(f, interest_left_end, interest_right_end)
    precision = 10^(-4); % Method precision (when to stop)

    fibonacci_num = (-1 + sqrt(5)) / 2;
    
    % Initial values
    left_end = interest_left_end;
    right_end = interest_right_end;
    interval_length = right_end - left_end;

    x1 = right_end - fibonacci_num * interval_length;
    x2 = left_end + fibonacci_num * interval_length;
    
    while interval_length > precision
        y1 = f(x1);
        y2 = f(x2);

        if y2 < y1
            left_end = x1;
            interval_length = right_end - left_end;
            x1 = x2;
            x2 = left_end + fibonacci_num * interval_length;
        else
            right_end = x2;
            interval_length = right_end - left_end;
            x2 = x1;
            x1 = right_end - fibonacci_num * interval_length;
        end
    end

    xm = (x1 + x2) / 2;
    ym = f(xm);
end