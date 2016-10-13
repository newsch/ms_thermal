% THERMOMETER  takes values and returns the flow of energy from conduction 
% and convection from the coffee cup.
% Q = -kA / d * delta_T
% Q = hA(T_o - T_s)
% Q_total = delta_T / (d / kA + 1 / hA)
function res = thermometer(~, thermal_cond, cond_area, ...
    cond_thickness, temp_grad, heat_trans, conv_area)
    conductive_r = cond_thickness / (thermal_cond * cond_area);
    convective_r = 1 / heat_trans * conv_area;
    energy_flow = temp_grad / (conductive_r + convective_r);
    res = energy_flow;
end