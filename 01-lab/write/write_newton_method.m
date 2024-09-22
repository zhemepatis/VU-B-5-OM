function write_newton_method(selected_points)
    point_table = table(selected_points');
    filename = 'results/excel/newton_method_results.xlsx';
    writetable(point_table, filename);
end