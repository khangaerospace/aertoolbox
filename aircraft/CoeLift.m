function [Cl] = CoeLift(W, rho, V, S)
    % input W: Weight of aircraft
    % input rho: density
    % input V: Aircraft velocity
    % input S: Wing Span
    % Outout Cl: Coefficient of lift
    Cl = W/(0.5*rho*(V^2)*S);
end