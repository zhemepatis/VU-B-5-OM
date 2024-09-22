function write_golden_ratio_method(selected_points)
    iteration_num = length(selected_points) / 2;

    rearranged_array = [];
    for curr_iteration = 0:iteration_num - 1
        x1 = selected_points(curr_iteration * 2 + 1);
        x2 = selected_points(curr_iteration * 2 + 2);
        rearranged_array = [rearranged_array; x1, x2];
    end

    point_table = table(rearranged_array);
    filename = 'results/golden_ratio_method_results.xlsx';
    writetable(point_table, filename);
end