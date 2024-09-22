function write_bisection_method(selected_points)
    iteration_num = (length(selected_points) - 1) / 3;

    rearranged_array = [];
    for curr_iteration = 0:iteration_num - 1
        xm = selected_points(curr_iteration * 3 + 1);
        x1 = selected_points(curr_iteration * 3 + 2);
        x2 = selected_points(curr_iteration * 3 + 3);
        rearranged_array = [rearranged_array; x1, x2, xm];
    end

    point_table = table([rearranged_array; 0, 0, selected_points(end)]);
    filename = 'results/bisection_method_results.xlsx';
    writetable(point_table, filename);
end
