%% Variable clean up, closing figures
clearvars; clc; close all;

%% defining functions
f = @(x, y, z) - x .* y .* z;
g = @(x, y, z) 2 * (x .* y + x .* z + z .* y) - 1;
h = @(x, y, z) [-x, -y, -z];

% penalty functions
b = @(x, y, z) g(x, y, z)^2 + sum(max(0, h(x, y, z)).^2);
B = @(x, y, z, r) f(x, y, z) + (1 / r) * b(x, y, z);

% gradient
grad = @(x, y, z, r) [
    - y * z + 4 * g(x, y, z) * (y + z) / r, ...
    - x * z + 4 * g(x, y, z) * (x + z) / r, ...
    - x * y + 4 * g(x, y, z) * (x + y) / r
];

%% parameters
init_r = 0.5;

%% applying method
init_point = [0, 0, 0];
results = penalty_method(init_point, init_r, 5, grad, 0.01, 10^(-6));
writematrix(results, "output/penalty_method_0_0.xlsx");

init_point = [1, 1, 1];
results = penalty_method(init_point, init_r, 5, grad, 0.01, 10^(-6));
writematrix(results, "output/penalty_method_1_1.xlsx");

init_point = [8/10, 1/10, 5/10];
results = penalty_method(init_point, init_r, 5, grad, 0.01, 10^(-6))
writematrix(results, "output/penalty_method_custom.xlsx");

% reikia ciklo, nes mazinant paramettra pradinis taskas tampa nebe init_point, bet min taskas rastas su r parametru buvusiu pries tai