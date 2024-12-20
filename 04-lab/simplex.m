function [min_value, solution, basis, intermediate_values] = simplex(A, B, C)
    constraint_num = size(B, 1);
    variable_num = size(A, 2);

    tableau = get_tableau(A, B, C);
    intermediate_values = tableau;

    basis = variable_num + 1 : variable_num + constraint_num;

    iterations = 1;
    while all(tableau(end, :) >= 0) ~= true
        [pivot_element, pivot_row_idx, pivot_col_idx] = get_pivot_element_coords(tableau);

        % reducing pivot row
        tableau(pivot_row_idx, :) = tableau(pivot_row_idx, :) ./ pivot_element;
        pivot_row = tableau(pivot_row_idx, :);
        pivot_col = tableau(:, pivot_col_idx);

        % reducing other rows
        tableau = tableau - pivot_col * pivot_row;
        tableau(pivot_row_idx, :) = pivot_row;

        % changing basis
        basis(pivot_row_idx) = pivot_col_idx;

        iterations = iterations + 1;
        intermediate_values = [intermediate_values; tableau];
    end

    % getting min value coordinates
    target_basis = basis(basis <= variable_num);
    target_basis_idx = 1 : length(basis);
    target_basis_idx = target_basis_idx(basis <= variable_num);

    solution = zeros(1, variable_num);
    solution(target_basis) = tableau(target_basis_idx, end);

    % getting the min value
    min_value = -tableau(end, end);
end


function tableau = get_tableau(A, B, C)
    constraint_num = size(B, 1);
    variable_num = size(A, 2);

    tableau = zeros(constraint_num + 1, constraint_num + variable_num + 1);
    tableau(1:constraint_num, 1:variable_num) = A;
    tableau(end, 1:variable_num) = C;

    identity_matrix = eye(constraint_num);
    tableau(1:constraint_num, variable_num + 1:variable_num + constraint_num) = identity_matrix;
    tableau(1:constraint_num, end) = B;
end


function [pivot_element, pivot_row_idx, pivot_col_idx] = get_pivot_element_coords(tableau)
    % finding pivot column
    [~, pivot_col_idx] = min(tableau(end, :));
    pivot_col = tableau(1 : end - 1, pivot_col_idx);
    
    % finding pivot row
    last_col = tableau(1 : end - 1, end);
    ratios = last_col ./ pivot_col;
    ratios(pivot_col <= 0) = inf;

    [~, pivot_row_idx] = min(ratios);

    % getting pivot element
    pivot_element = pivot_col(pivot_row_idx);
end