function selected_points = deformed_simplex(f, initial_point, alfa)
    gamma = 2;
    beta = 0.5;
    nu = -0.5;

    max_step_num = 100;
    step_threshold = 10^(-4);

    curr_simplex = get_initial_simplex(f, initial_point, alfa);
    selected_points = [curr_simplex];

    for i = 1:max_step_num
        area = get_simplex_area(curr_simplex)
        if area < step_threshold
            break;
        end

        curr_simplex = sort_simplex(curr_simplex)
        middle_point = get_middle_point(curr_simplex);
        middle_point(3) = f(middle_point(1), middle_point(2));

        reflection = get_new_point(middle_point, curr_simplex(1), 1)
        reflection(3) = f(reflection(1), reflection(2));

        x_h = curr_simplex(1, :)
        x_g = curr_simplex(2, :)
        x_l = curr_simplex(3, :)

        new_point = [-1, -2, -3];
        if x_l(3) < reflection(3) && reflection(3) < x_g(3)
            new_point = reflection;
            disp("1")
        elseif reflection(3) < x_l(3)
            new_point = get_new_point(middle_point, curr_simplex(1), gamma);
            disp("2")
        elseif reflection(3) > x_h(3)
            new_point = get_new_point(middle_point, curr_simplex(1), nu);
            disp("3")
        elseif  x_g(3) < reflection(3) && reflection(3) < x_h(3)
            new_point = get_new_point(middle_point, curr_simplex(1), beta);
            disp("4")
        end

        new_point = validate_point(new_point);
        curr_simplex(1, :) = new_point;
        selected_points = [selected_points; new_point]
    end

end

function simplex = get_initial_simplex(f, initial_point, alfa)
    vertex_num = 2;
    delta_1 = (sqrt(vertex_num + 1) + vertex_num - 1) * alfa / (vertex_num * sqrt(2));
    delta_2 = (sqrt(vertex_num + 1) - 1) * alfa / (vertex_num * sqrt(2));

    simplex = [initial_point, f(initial_point(1), initial_point(2))];
    for i = 1:vertex_num
        curr_point_coords = [];
        for j = 1:vertex_num
            if i ~= j
                curr_point_coords = [curr_point_coords, initial_point(j) + delta_1];
            else 
                curr_point_coords = [curr_point_coords, initial_point(j) + delta_2];
            end
        end

        simplex = [simplex; curr_point_coords, f(curr_point_coords(1), curr_point_coords(2))];
    end
end


function simplex = sort_simplex(simplex)
    vertex_num = 3;

    for i = 1:vertex_num
        for j = (i+1):vertex_num
            z_i = simplex(i, 3);
            z_j = simplex(j, 3);

            if z_j > z_i
                point_i = simplex(i, :);
                point_j = simplex(j, :);

                simplex(i, :) = point_j;
                simplex(j, :) = point_i;
            end
        end
    end
end

function area = get_simplex_area(simplex)
    point_1 = simplex(1, :);
    point_2 = simplex(2, :);
    point_3 = simplex(3, :);
    area = abs(point_1(1)*(point_2(2) - point_3(2)) + point_2(1)*(point_3(2) - point_1(2)) + point_3(1)*(point_1(2) - point_2(2)) ) / 2;
end

function middle_point = get_middle_point(simplex)
    xc = (simplex(2, 1:2) + simplex(3, 1:2)) / 2;
    middle_point = [xc, 0];
end

function reflection = get_new_point(middle_point, worst_point, theta)
    reflection = worst_point + (1 + theta) * (middle_point - worst_point);
end

function point = validate_point(point)
    for i = 1:2
        if point(i) < 0
            point(i) = 0;
        end
    end
end