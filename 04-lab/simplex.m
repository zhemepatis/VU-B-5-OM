function result = simplex(A, B, C)
    tableau = get_tableau(A, B, C)




    result = 1; 
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