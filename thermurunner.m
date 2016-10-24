% THERMURUNNER  runs thermulator_euler and thermulator_ode45 and makes nice
% plots
Mats = [0.02, 0.01];
xbash
[time, temp] = thermulator_ode45(0, 30 * 60, Mats);

hold on
for i = 1:length(Mats)
    plot(time / 60, temp(:,1), '.-')
end

title('Temp of Coffee over Time with ode45 Estimation')
xlabel('Time (m)')
ylabel(['Temperature (', char(176), 'C)'])