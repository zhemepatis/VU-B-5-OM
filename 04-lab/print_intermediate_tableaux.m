function print_intermediate_tableaux(tableaux, constraint_num)
    iterations = size(tableaux, 1) / constraint_num - 1;
    tableau_row_count = constraint_num + 1;

    for i = 1 : iterations
        disp("Iteration no. " + int2str(i))
        disp(tableaux((i - 1) * tableau_row_count + 1 : i * tableau_row_count, :))
    end
end