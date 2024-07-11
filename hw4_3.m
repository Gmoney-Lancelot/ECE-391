% Constants
Z0 = 50; % Characteristic Impedance (ohms)
zr = 50; % Transmission line length (m)
vp = 0.3; % Propagation Velocity (m/ns)
f = 7.5e6; % Frequency (Hz)
A = 10; % Amplitude of the incident wave (V)

% Termination Impedances
ZT_a = Z0/4; % Termination Impedance for Part (a)
ZT_b = 4*Z0; % Termination Impedance for Part (b)
L_c = 398e-9; % Inductance for Part (c)
C_d = 79.6e-12; % Capacitance for Part (d)

% Calculating Reflection Coefficients for each case
Gamma_a = (ZT_a - Z0)/(ZT_a + Z0);
Gamma_b = (ZT_b - Z0)/(ZT_b + Z0);
Gamma_c = 1i*2*pi*f*L_c*vp;
Gamma_d = 1i/(2*pi*f*C_d*vp);

% Voltage Standing-Wave Ratio (VSWR) for each case
VSWR_a = (1 + abs(Gamma_a))/(1 - abs(Gamma_a));
VSWR_b = (1 + abs(Gamma_b))/(1 - abs(Gamma_b));
VSWR_c = (1 + abs(Gamma_c))/(1 - abs(Gamma_c));
VSWR_d = (1 + abs(Gamma_d))/(1 - abs(Gamma_d));

% Calculating Voltage and Current Standing-Wave Patterns for each case
z = linspace(0, zr, 1000);
v_a = A * (1 + Gamma_a * exp(-2i * pi * f * z / vp)) .* exp(1i * 2 * pi * f * z / vp);
v_b = A * (1 + Gamma_b * exp(-2i * pi * f * z / vp)) .* exp(1i * 2 * pi * f * z / vp);
v_c = A * (1 + Gamma_c * exp(-2i * pi * f * z / vp)) .* exp(1i * 2 * pi * f * z / vp);
v_d = A * (1 + Gamma_d * exp(-2i * pi * f * z / vp)) .* exp(1i * 2 * pi * f * z / vp);

i_a = v_a/Z0;
i_b = v_b/Z0;
i_c = v_c/Z0;
i_d = v_d/Z0;

% Plotting Voltage Standing-Wave Patterns
figure
plot(z, abs(v_a), z, abs(v_b), z, abs(v_c), z, abs(v_d))
title('Voltage Standing-Wave Patterns')
xlabel('Distance (m)')
ylabel('Voltage (V)')
legend('ZT = Z0/4', 'ZT = 4Z0', 'L = 398 nH', 'C = 79.6 pF')

% Plotting Current Standing-Wave Patterns
figure
plot(z, abs(i_a), z, abs(i_b), z, abs(i_c), z, abs(i_d))
title('Current Standing-Wave Patterns')
xlabel('Distance (m)')
ylabel('Current (A)')
legend('ZT = Z0/4', 'ZT = 4Z0', 'L = 398 nH', 'C = 79.6')