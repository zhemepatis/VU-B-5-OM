function write_bisection_method(selected_points)
    iteration_num = length(selected_points) / 3;

    rearranged_array = [];
    for curr_iteration = 0:iteration_num - 1
        x1 = selected_points(curr_iteration * 3 + 1);
        x2 = selected_points(curr_iteration * 3 + 2);
        xm = selected_points(curr_iteration * 3 + 3);
        rearranged_array = [rearranged_array; x1, x2, xm];
    end

    point_table = table(rearranged_array);
    filename = 'results/bisection_method_results.xlsx';
    writetable(point_table, filename);
end
