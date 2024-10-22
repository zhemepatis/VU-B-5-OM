function past_simplexes = deformed_simplex(f, initial_point, alfa, shrink_coef)
    gamma = 2;
    beta = 0.5;
    nu = -0.5;

    max_step_num = 1000;
    step_threshold = 10^(-4);

    initial_point = [initial_point, f(initial_point(1), initial_point(2))];
    curr_simplex = get_simplex(f, initial_point, alfa);
    past_simplexes = curr_simplex;

    for i = 1:max_step_num
        area = get_simplex_area(curr_simplex);
        if area < step_threshold
            break;
        end

        curr_simplex = sort_simplex(curr_simplex);
        middle_point = get_middle_point(curr_simplex);
        middle_point(3) = f(middle_point(1), middle_point(2));

        reflection = get_new_point(middle_point, curr_simplex(1), 1);
        reflection = validate_point(f, reflection);

        x_h = curr_simplex(1, :);
        x_g = curr_simplex(2, :);
        x_l = curr_simplex(3, :);

        new_point = [0, 0, 0];
        if x_l(3) < reflection(3) && reflection(3) < x_g(3)
            new_point = reflection;
        elseif reflection(3) < x_l(3)
            new_point = get_new_point(middle_point, curr_simplex(1), gamma);
            new_point = validate_point(f, new_point);  % Ensure valid new point
        elseif reflection(3) > x_h(3)
            new_point = get_new_point(middle_point, curr_simplex(1), nu);
            new_point = validate_point(f, new_point);
        elseif x_g(3) < reflection(3) && reflection(3) < x_h(3)
            new_point = get_new_point(middle_point, curr_simplex(1), beta);
            new_point = validate_point(f, new_point);
        end

        curr_simplex(1, :) = new_point;
        curr_simplex = sort_simplex(curr_simplex);

        is_repetition = check_repetition(curr_simplex, past_simplexes, 3);
        if is_repetition
            alfa = alfa / shrink_coef;
            curr_simplex = get_simplex(f, curr_simplex(3, :), alfa);
        end

        past_simplexes = [past_simplexes; curr_simplex];
    end
end

function simplex = get_simplex(f, initial_point, alfa)
    vertex_num = 2;
    delta_1 = (sqrt(vertex_num + 1) + vertex_num - 1) * alfa / (vertex_num * sqrt(2));
    delta_2 = (sqrt(vertex_num + 1) - 1) * alfa / (vertex_num * sqrt(2));

    simplex = initial_point;
    for i = 1:vertex_num
        curr_point_coords = initial_point(1:2);
        for j = 1:vertex_num
            if i == j
                curr_point_coords(j) = curr_point_coords(j) + delta_2;
            else
                curr_point_coords(j) = curr_point_coords(j) + delta_1;
            end
        end
        simplex = [simplex; curr_point_coords, f(curr_point_coords(1), curr_point_coords(2))];
    end
end

function simplex = sort_simplex(simplex)
    [~, idx] = sort(simplex(:, 3), 'descend');
    simplex = simplex(idx, :);
end

function area = get_simplex_area(simplex)
    point_1 = simplex(1, :);
    point_2 = simplex(2, :);
    point_3 = simplex(3, :);
    area = abs(point_1(1)*(point_2(2) - point_3(2)) + point_2(1)*(point_3(2) - point_1(2)) + point_3(1)*(point_1(2) - point_2(2))) / 2;
end

function middle_point = get_middle_point(simplex)
    xc = (simplex(2, 1:2) + simplex(3, 1:2)) / 2;
    middle_point = [xc, 0];
end

function new_point = get_new_point(middle_point, worst_point, theta)
    new_point = worst_point + (1 + theta) * (middle_point - worst_point);
end

function point = validate_point(f, point)
    for i = 1:2
        if point(i) < 0
            point(i) = 0;
        end
    end
    point(3) = f(point(1), point(2));
end

function is_repetition = check_repetition(curr_simplex, past_simplexes, max_repetition_num)
    is_repetition = false;
    simplex_num = size(past_simplexes, 1) / 3;

    if simplex_num < max_repetition_num
        return;
    end

    check_start = (simplex_num - max_repetition_num) * 3 + 1;
    check_end = simplex_num * 3;

    for i = 1:3
        repetition_count = 0;
        curr_point = curr_simplex(i, :);

        for j = check_start:check_end
            if isequal(curr_point, past_simplexes(j, :)) 
                repetition_count = repetition_count + 1;
            end
        end

        if repetition_count == max_repetition_num
            is_repetition = true;
            break;
        end
    end
end