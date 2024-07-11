f = 10e6; % frequency
v = 1 / sqrt(2.25) * 3e8; % velocity
beta = 2*pi*(f/v); % propagation constant
Z0 = 50; % characteristic impedance
ZL = 70 - 30j; % load impedance
Gamma_v = (ZL - Z0) / (ZL + Z0); % voltage reflection coefficient
Gamma_i = (Z0 - ZL) / (ZL + Z0); % current reflection coefficient
z = linspace(0, 5, 500); %