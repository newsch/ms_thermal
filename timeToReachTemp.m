function res = timeToReachTemp(mat_matrix, desired_temp)
%TIMETOREACHTEMP Return final time based on material, thickness, and
%desired temp.
%   Detailed explanation
    [time, ~] = thermulator_ode45(0, 30 * 60, mat_matrix, desired_temp);
    time_reached = time(length(time));
    res = time_reached / 60;
end

