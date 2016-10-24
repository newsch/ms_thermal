% THERMULATOR  models the temperature of a coffee cup over time with
% Euler's method.
%{
mat_matrix = [insulating_cond insulating_thick]
%}
function [t, T] = thermulator_ode45(init_time, final_time, mat_matrix)

    %% Model Parameters
    thermos_r = 0.04; % thermos radius, in m
    water_h = 0.15; % water height, in m
    
    init_temp = 370; % in K
    room_temp = 290; % in K
    water_s_heat = 4186; % specific heat of coffee, in J/kg*K
    water_density = 1000; % density of coffee, in kg/m^3
    
    %% Calculated Stuff
    function res = circ_area(radius)
        res = radius ^ 2 * pi;
    end

    function res = wall_area(radius, height)
        res = height * 2 * pi * radius;
    end

    function res = cond_area(radius, height)
        res = circ_area(radius) + wall_area(radius, height);
    end

    function res = heat_cap(radius, height, s_heat, density)
        res = s_heat * circ_area(radius) * height * density;
    end

    water_heat_cap = heat_cap(thermos_r, water_h, water_s_heat, water_density);

    layer_thermal_cond = mat_matrix(1);
    layer_thickness = mat_matrix(2);
    layer_radius = mat_matrix(2) + thermos_r;
    layer_cond_area = cond_area(layer_radius, water_h);
    
    layer_info = [layer_thermal_cond, layer_cond_area, layer_thickness];
    
    %% Anonymous Function for ode
    dUdt = @(ti, Ui) thermometer(ti, layer_info, (room_temp - energyToTemperature(Ui, water_heat_cap)));
    
    %% ODE45
    [t, U] = ode45(dUdt, [init_time final_time], temperatureToEnergy(init_temp, water_heat_cap));
    % convert to celsius temp
    T = energyToTemperature(U, water_heat_cap) - 273.15;
end