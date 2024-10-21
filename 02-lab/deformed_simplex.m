function selected_points = deformed_simplex(f, initial_point, alfa)
    n = nargin(f);

    curr_simplex = get_initial_simplex(initial_point, n, alfa);
    selected_points = [curr_simplex];
    area = inf;

    i = 0;
    while area > 0.001
        worst_point_idx = get_worst_point(f, curr_simplex);
        worst_point = curr_simplex(worst_point_idx, :);
        curr_simplex(worst_point_idx, :) = [];
        
        new_point = get_new_point(curr_simplex, worst_point, 2);
        curr_simplex = [curr_simplex; new_point];
        selected_points = [selected_points; new_point];
        
        i = i+1

        if i == 5
            break
        end

        area = get_triangle_area_by_points(curr_simplex(1, :), curr_simplex(2, :), curr_simplex(3, :))
    end
end

function simplex_points = get_initial_simplex(initial_point, n, alfa)
    delta_1 = (sqrt(n + 1) + n - 1) * alfa / (n * sqrt(2));
    delta_2 = (sqrt(n + 1) - 1) * alfa / (n * sqrt(2));

    points = [initial_point];
    for i = 1:n
        curr_point_coords = [];
        for j = 1:n
            if i ~= j
                curr_point_coords = [curr_point_coords, initial_point(j) + delta_1];
            else 
                curr_point_coords = [curr_point_coords, initial_point(j) + delta_2];
            end
        end

        points = [points; curr_point_coords];
    end

    simplex_points = points;
end

function worst_point_idx = get_worst_point(f, points)
    max_value = -Inf;
    worst_point_idx = -1;

    for i = 1:3
        x = points(i, 1);
        y = points(i, 2);

        value = f(x, y);
        if max_value < value
            worst_point_idx = i;
        end
    end
end

function central_point = get_central_point(points, point_to_be_changed)
    xc = [0, 0];
    for i = 1:2
        xc = xc + points(i, :);
    end
    central_point = xc/2;
end

function deformed_simplex = deform_simplex(points, moving_point, f)
    gamma = 2;
    beta = 0.5;
    nu = -0.5;

    xc = get_central_point(points, moving_point);
    
    reflection = moving_point + (theta + 1) * (xc - moving_point);



    % deforming simplex if it is beyond allowed limits
    for i = 1:2
        if moving_point(i) < 0
            moving_point(i) = 0;
        end
    end
end

function area = get_triangle_area_by_points(point1, point2, point3)
    area = abs(point1(1)*(point2(2) - point3(2)) + point2(1)*(point3(2) - point1(2)) + point3(1)*(point1(2) - point2(2)) ) / 2;
end