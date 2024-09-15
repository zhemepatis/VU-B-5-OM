clearvars, clc

% Declaring function
a = 1;
b = 5;
func = @(x) ((x.^2 - a).^2) / (b - 1);

% Method precision (when to stop)
precision = 10^(-4);

% Initial values
left_end = 0;
right_end = 10;
interval_length = right_end - left_end;
x_m = (left_end + right_end) / 2;

while interval_length > precision
    x_1 = left_end + interval_length / 4;
    x_2 = right_end - interval_length / 4;

    if func(x_1) < func(x_m)
        right_end = x_m;
        x_m = x_1;
    elseif func(x_2) < func(x_m)
        left_end = x_m;
        x_m = x_2;
    elseif func(x_1) >= func(x_m) && func(x_2) >= func(x_m)
        left_end = x_1;
        right_end = x_2;
    end

    interval_length = right_end - left_end;
end

x_m % - result