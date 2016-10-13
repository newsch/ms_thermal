% THERMURUNNER  runs thermulator_euler and thermul`ator_ode45 and makes nice
% plots

[time_o, temp_o] = thermulator_ode45(0, 30 * 60, @thermometer);

hold on
plot(time_o / 60, temp_o, '.-')

title('Temp of Coffee over Time with ode45 Estimation')
xlabel('Time (m)')
ylabel(['Temperature (', char(176), 'C)'])