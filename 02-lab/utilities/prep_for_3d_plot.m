function prep_for_3d_plot(x_limits, y_limits, z_limits)
    hold on;
    axis equal; 

    xlim(x_limits);
    ylim(y_limits);
    zlim(z_limits)

    xlabel('x'); 
    ylabel('y');
    zlabel('z');

    grid on;

    hold off;
end