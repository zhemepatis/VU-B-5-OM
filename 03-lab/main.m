%% Variable clean up, closing figures
clearvars; clc; close all;

%% defining functions
f = @(x, y, z) - x .* y .* z;
g = @(x, y, z) 2 * (x .* y + x .* z + z .* y) - 1;
h = @(x, y, z) [-x, -y, -z];

% penalty functions
b = @(x, y, z) g(x, y, z).^2 + sum(max(0, h(x, y, z)).^2);
B = @(x, y, z, r) f(x, y, z) + b(x, y, z) ./ r;

% gradient
grad = @(x, y, z, r) [
    - y * z + (4 * g(x, y, z) * (y + z) + 2 * max(0, - x)) / r, ...
    - x * z + (4 * g(x, y, z) * (x + z) + 2 * max(0, - y)) / r, ...
    - x * y + (4 * g(x, y, z) * (x + y) + 2 * max(0, - z)) / r
];

%% parameters
init_r = .5;

% applying method
init_point = [0, 0, 0];
results = penalty_method(B, init_point, init_r, .5, 10, grad, 1, 10^(-4));
B_results = B(results(:, 2), results(:, 3), results(:, 4), results(:, 1));
b_results = b(results(:, 2), results(:, 3), results(:, 4)) ./ results(:, 1);
f_results = f(results(:, 2), results(:, 3), results(:, 4));
result_table = [results(:, 1:4), f_results, B_results(:, 1), b_results(:, 1), results(:, 5:6)]
writematrix(result_table, "output/penalty_method_0_0.xlsx");

init_point = [1, 1, 1];
results = penalty_method(B, init_point, init_r, .5, 10, grad, 1, 10^(-4));
B_results = B(results(:, 2), results(:, 3), results(:, 4), results(:, 1));
b_results = b(results(:, 2), results(:, 3), results(:, 4)) ./ results(:, 1);
f_results = f(results(:, 2), results(:, 3), results(:, 4));
result_table = [results(:, 1:4), f_results, B_results(:, 1), b_results(:, 1), results(:, 5:6)]
writematrix(result_table, "output/penalty_method_1_1.xlsx");

init_point = [.8, .1, .5];
results = penalty_method(B, init_point, init_r, .7, 10, grad, .8, 10^(-4));
B_results = B(results(:, 2), results(:, 3), results(:, 4), results(:, 1));
b_results = b(results(:, 2), results(:, 3), results(:, 4)) ./ results(:, 1);
f_results = f(results(:, 2), results(:, 3), results(:, 4));
result_table = [results(:, 1:4), f_results, B_results(:, 1), b_results(:, 1), results(:, 5:6)]
writematrix(result_table, "output/penalty_method_custom.xlsx");

