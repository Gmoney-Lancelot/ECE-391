%% Parameters
Zo = 50;            % characteristic impedance (ohms)
z = 50;             % length of transmission line (m)
v = 0.3;            % velocity of propagation (m/ns)
f = 7.5e6;          % frequency (Hz)
lambda = v/f;       % wavelength (m)
beta = 2*pi/lambda; % propagation constant (rad/m)
L = 398e-9;         % load inductance (H)
C = 79.6e-12;       % load capacitance (F)
ZL_a = Zo/4;        % termination impedance for case (a)
ZL_b = 4*Zo;        % termination impedance for case (b)

%% Reflection coefficients
Gamma_a = (ZL_a - Zo)/(ZL_a + Zo);
Gamma_b = (ZL_b - Zo)/(ZL_b + Zo);
Gamma_c = 1i*beta*L/(1i*beta*L + 1/(1i*beta*C));
Gamma_d = 1/(1i*beta*C + 1/(1i*beta*L));

%% Voltage and current standing-wave patterns
% Calculate the voltage and current at each point along the transmission line
Z = Zo*(ZL_a + Gamma_a*Zo*exp(-1i*beta*z))/(Zo + ZL_a*Gamma_a*exp(-1i*beta*z));
V_a = 10*exp(1i*2*pi*f*sqrt(L*C))*exp(1i*beta*z) + Z*Gamma_a*10*exp(1i*2*pi*f*sqrt(L*C))*exp(-1i*beta*z);
I_a = (10/Zo)*exp(1i*2*pi*f*sqrt(L*C))*exp(1i*beta*z) - (Zo*Gamma_a*10/Z)*exp(1i*2*pi*f*sqrt(L*C))*exp(-1i*beta*z);

Z = Zo*(ZL_b + Gamma_b*Zo*exp(-1i*beta*z))/(Zo + ZL_b*Gamma_b*exp(-1i*beta*z));
V_b = 10*exp(1i*2*pi*f*sqrt(L*C))*exp(1i*beta*z) + Z*Gamma_b*10*exp(1i*2*pi*f*sqrt(L*C))*exp(-1i*beta*z);
I_b = (10/Zo)*exp(1i*2*pi*f*sqrt(L*C))*exp(1i*beta*z) - (Zo*Gamma_b*10/Z)*exp(1i*2*pi*f*sqrt(L*C))*exp(-1i*beta*z);

Z = Zo*(1i*beta*L + 1/(1i*beta*C) + 1i*beta*Zo*tan(beta*z))/(1i*beta*L + 1/(1i*beta*C) - 1i*beta*Zo*tan(beta*z));
V_c = 10*exp(1i*2*pi*f*sqrt(L*C))*exp(1i*beta*z) + Z*(1 - Gamma_c)*10