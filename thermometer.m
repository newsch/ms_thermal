% THERMOMETER  takes values and returns the flow of energy through 
% conduction from the thermos. Expects a matrix of conductivity,
% area, and thickness for insulating layer.
% [insulating_cond, insulating_area, insulating_thick]
% Q = -kA / d * delta_T
% Q_total = delta_T / (d / kA)
function res = thermometer(~, layer_matrix, temp_grad)
    layers_r = zeros(length(layer_matrix(:,1)),0);
    for i=1:length(layer_matrix(:,1))
        layer_cond = layer_matrix(i,1);
        layer_area = layer_matrix(i,2);
        layer_thick = layer_matrix(i,3);
        layers_r(i) = layer_thick / (layer_cond * layer_area);
    end
    
    energy_flow = temp_grad / (sum(1 ./ layers_r));
    res = energy_flow;
end