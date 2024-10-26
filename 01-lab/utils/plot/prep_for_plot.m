function prep_for_plot(x_limits, y_limits)
    hold on;

    grid on;

    axis equal; 
    axis_line = xline(0);
    axis_line.HandleVisibility = "off";
    axis_line = yline(0);
    axis_line.HandleVisibility = "off";

    xlim(x_limits);
    ylim(y_limits);

    xlabel('x'); 
    ylabel('y');
    legend('Interpreter', 'latex');

    hold off;
end