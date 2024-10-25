function prep_for_plot(x_limits, y_limits)
    hold on;
    axis equal; 

    xlim(x_limits);
    ylim(y_limits);

    xlabel('x'); 
    ylabel('y');

    grid on;

    hold off;
end