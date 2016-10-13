% THERMULATOR  models the temperature of a coffee cup over time with
% Euler's method
function [t, T] = thermulator_ode45(init_time, final_time, flow_func)

    %% Model Parameters
    cup_r = 0.04; % cup radius, in m
    coffee_h = 0.15; % coffee height, in m
    cup_t = 0.007; % cup thickmess, in m
    init_temp = 370; % in K
    room_temp = 290; % in K
    coffee_s_heat = 4186; % specific heat of coffee, in J/kg*K
    coffee_density = 1000; % density of coffee, in kg/m^3
    cup_thermal_cond = 1.5; % in W/m*K
    coffee_heat_transfer_c = 10; % 10-100, in W/m^2K
    dt = 60; % time step, in seconds
    
    %% Calculated Stuff
    cup_base_r = cup_r;
    cup_wall_area = coffee_h * 2 * pi * cup_base_r;
    cup_base_area = cup_base_r ^ 2 * pi;
    cup_area = cup_wall_area + cup_base_area;
    coffee_heat_cap = coffee_s_heat * cup_base_area * coffee_h * ...
        coffee_density;
    
    %% Anonymous Function
    dUdt = @(ti, Ui) flow_func(ti, cup_thermal_cond, cup_area, cup_t, ...
        (room_temp - energyToTemperature(Ui, coffee_heat_cap)), ...
        coffee_heat_transfer_c, cup_wall_area);
    
    %% ODE45
    [t, U] = ode45(dUdt, [init_time final_time], temperatureToEnergy(init_temp, coffee_heat_cap));
    % convert to celsius temp
    T = energyToTemperature(U, coffee_heat_cap) - 273.15;
end