% THERMURUNNER  runs thermulator_euler and thermulator_ode45 and makes nice
% plots
Mats = [0.02, 0.01];
times_to_reach = [300:10:350];

mat_output = zeros(length(times_to_reach),2);
    for j = 1:length(times_to_reach)
       mat_output(j,:) = [times_to_reach(j) timeToReachTemp(Mats, times_to_reach(j))]
    end

plot(mat_output(:,1), mat_output(:,2), '-o')