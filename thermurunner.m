% THERMURUNNER  runs thermulator_euler and thermul`ator_ode45 and makes nice
% plots

[time_e, temp_e] = thermulator_euler(0, 30 * 60, @thermometer);
[time_o, temp_o] = thermulator_ode45(0, 30 * 60, @thermometer);

hold on
plot(time_e / 60, temp_e, '.-')
plot(time_o / 60, temp_o, '.-')

title('Temp of Coffee over Time with ode45 and Euler Estimation')
xlabel('Time (m)')
ylabel(['Temperature (', char(176), 'C)'])
legend('Euler''s Method', 'ode45')