%% Variable clean up, closing figures
clearvars; clc; close all;

% defining functions
r = 0.125;

f = @(x, y, z) - x .* y .* z;
g = @(x, y, z) 2 * (x .* y + x .* z + z .* y) - 1;
h = @(x, y, z) [-x, -y, -z];

% penalty functions
b = @(x, y, z) g(x, y, z)^2 + sum(max(0, h(x, y, z)).^2);
B = @(x, y, z) f(x, y, z) + (1 / r) * b(x, y, z);

B(0, 0, 0)



