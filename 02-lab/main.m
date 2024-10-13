%% variabel clean up, closing figures
clearvars, clc, close all

addpath("utilities");

f = @(x, y) (x.*y - x.^2.*y - x.*y.^2)/8;

prep_for_3d_plot([-0.5, 1.5], [-0.5, 1.5], [-1.5, 0.5])
plot_3d_function(f)
