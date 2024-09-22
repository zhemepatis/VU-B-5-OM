function selected_x_values = bisection_method(f, interest_left_end, interest_right_end)
    precision = 10^(-4); % Method precision (when to stop)
    
    % Initial values
    left_end = interest_left_end;
    right_end = interest_right_end;
    interval_length = right_end - left_end;
    xm = (left_end + right_end) / 2;

    selected_x_values = [];
    while true
        x1 = left_end + interval_length / 4;
        x2 = right_end - interval_length / 4;

        selected_x_values = [selected_x_values, xm, x1, x2];

        y1 = f(x1);
        y2 = f(x2);
        ym = f(xm);
    
        if y1 < ym
            right_end = xm;
            xm = x1;
        elseif y2 < ym
            left_end = xm;
            xm = x2;
        elseif y1 >= ym && y2 >= ym
            left_end = x1;
            right_end = x2;
        end

        interval_length = right_end - left_end;
        if interval_length < precision
            break;
        end
    end

    selected_x_values = [selected_x_values, xm]
end