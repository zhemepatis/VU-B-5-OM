function intermediate_values = deformed_simplex(f, initial_point, alfa, shrink_coef)
    step_threshold = 0.0001;
    max_iteration_num = 50;
    max_point_repetition_num = 3;

    gamma = 2;
    beta = 0.5;
    niu = -0.5;
    
    initial_point = supplement_point(f, [initial_point, 0]);
    simplex = get_initial_simplex(f, initial_point, alfa);
    func_calls = 3;

    [changes, simplex] = validate_simplex(f, simplex);
    func_calls = func_calls + changes;

    simplex = sort_simplex(simplex);
    intermediate_values = simplex;

    area = inf;
    iterations = 1;
    while area > step_threshold && iterations < max_iteration_num
        worst_point = simplex(1, :);
        good_point = simplex(2, :);
        best_point = simplex(3, :);

        if check_simplex_for_repetition(simplex, intermediate_values, max_point_repetition_num)
            simplex = shrink_simplex(f, simplex, shrink_coef);
            simplex = sort_simplex(simplex);

            intermediate_values = [intermediate_values; simplex];
            func_calls = func_calls + 2;

            iterations = iterations + 1;
            area = get_simplex_area(simplex);
            continue
        end

        midpoint = get_middle_point(simplex);

        reflection = get_new_point(worst_point, midpoint, 1); % get worst point reflection
        [~, reflection] = validate_point(reflection);
        reflection = supplement_point(f, reflection);
        func_calls = func_calls + 1;

        new_point = [0, 0, 0];
        if best_point(3) < reflection(3) && reflection(3) < good_point(3)
            new_point = reflection;
        elseif reflection(3) < best_point(3)
            new_point = get_new_point(worst_point, midpoint, gamma);
            [~, new_point] = validate_point(new_point);
            new_point = supplement_point(f, new_point);
            func_calls = func_calls + 1;
        elseif reflection(3) > worst_point(3)
            new_point = get_new_point(worst_point, midpoint, niu);
            [~, new_point] = validate_point(new_point);
            new_point = supplement_point(f, new_point);
            func_calls = func_calls + 1;
        elseif good_point(3) < reflection(3) && reflection(3) < worst_point(3)
            new_point = get_new_point(worst_point, midpoint, beta);
            [~, new_point] = validate_point(new_point);
            new_point = supplement_point(f, new_point);
            func_calls = func_calls + 1;
        end

        simplex = [good_point; best_point; new_point];
        simplex = sort_simplex(simplex);
        intermediate_values = [intermediate_values; simplex];

        iterations = iterations + 1;
        area = get_simplex_area(simplex);
    end

    disp("Iterations: " + num2str(iterations));
    disp("Function calls: " + num2str(func_calls));
end

function simplex = get_initial_simplex(f, initial_point, alfa)
    vertex_num = 2;
    delta_1 = (sqrt(vertex_num + 1) + vertex_num - 1) * alfa / (vertex_num * sqrt(2));
    delta_2 = (sqrt(vertex_num + 1) - 1) * alfa / (vertex_num * sqrt(2));
    
    point_1 = [initial_point(1) + delta_2, initial_point(2) + delta_1];
    point_1 = supplement_point(f, point_1);

    point_2 = [initial_point(1) + delta_1, initial_point(2) + delta_2];
    point_2 = supplement_point(f, point_2);

    simplex = [initial_point; point_1; point_2];
end

function simplex = shrink_simplex(f, simplex, shrink_coef)
    best_point = simplex(end, :);
    
    for i = 1:(size(simplex, 1) - 1)
        simplex(i, 1:2) = best_point(1:2) + shrink_coef * (simplex(i, 1:2) - best_point(1:2));
        simplex(i, :) = supplement_point(f, simplex(i, :));
    end
end

function [changes, simplex] = validate_simplex(f, simplex)
    changes = 0;
    for i = 1:3
        [has_changed, new_point] = validate_point(simplex(i, :));
        if has_changed
            new_point = supplement_point(f, new_point);
            simplex(i, :) = new_point;
            changes = changes + 1;
        end
    end
end

function [has_changed, point] = validate_point(point)
    has_changed = false;
    for i = 1:2
        if point(i) < 0
            point(i) = 0;
            has_changed = true;
        end
    end
end

function simplex = sort_simplex(simplex)
    [~, idx] = sort(simplex(:, 3), 'descend');
    simplex = simplex(idx, :);
end

function point = supplement_point(f, point)
    x = point(1);
    y = point(2);
    point = [x, y, f(x, y)];
end

% assumes that simplex is sorted
function midpoint = get_middle_point(simplex)
    midpoint = sum(simplex(2:3, :))/2;
end

function point = get_new_point(worst_point, midpoint, theta)
    point = worst_point + (1 + theta) * (midpoint - worst_point);
end

function has_repetition = check_point_repetition(point, past_simplexes, max_repetition_num)
    has_repetition = false;
    simplex_num = size(past_simplexes, 1) / 3;

    if simplex_num < max_repetition_num
        return;
    end

    repetition_count = 0;
    check_start = (simplex_num - max_repetition_num) * 3 + 1;
    check_end = simplex_num * 3;
    for j = check_start:check_end
        if isequal(point, past_simplexes(j, :)) 
            repetition_count = repetition_count + 1;
        end
    end

    if repetition_count == max_repetition_num
        has_repetition = true;
    end
end

function has_repetition = check_simplex_for_repetition(simplex, past_simplexes, max_point_repetition_num)
    for i = 1:3
        point = simplex(i, :);
        has_repetition = check_point_repetition(point, past_simplexes, max_point_repetition_num);
        if has_repetition
            break
        end
    end
end

function area = get_simplex_area(simplex)
    point_1 = simplex(1, :);
    point_2 = simplex(2, :);
    point_3 = simplex(3, :);
    area = abs(point_1(1)*(point_2(2) - point_3(2)) + point_2(1)*(point_3(2) - point_1(2)) + point_3(1)*(point_1(2) - point_2(2)) ) / 2;
end