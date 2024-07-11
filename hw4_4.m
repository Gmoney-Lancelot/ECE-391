f = 10e6; % frequency
v = 1 / sqrt(2.25) * 3e8; % velocity
beta = 2*pi*f/v; % propagation constant
lamb = v/f; % wavelength
Z0 = 50; % characteristic impedance
ZL = 70 - 30j; % load impedance
Gamma_v = (ZL - Z0) / (ZL + Z0); % voltage reflection coefficient
Gamma_i = (Z0 - ZL) / (ZL + Z0); % current reflection coefficient
z = linspace(0, 5, 500); %
z_i = linspace(1, 5, 501); %

VSWR = abs((1+Gamma_v*exp(-2j*pi*z/lamb))./(1-Gamma_v*exp(-2j*pi*z/lamb)));


figure;
plot(z,VSWR);

xlabel('Distance (m)');

ylabel('VSWR');

title('Voltage Standing-Wave Pattern');

% current standing-wave pattern 
ISWR = abs((1-Gamma_i*exp(-2j*pi*z_i/lamb))./(Z0(1+Gamma_i*exp(-2j*pi*z_i/lamb))));

figure;
plot(z,ISWR);

xlabel('Distance (m)');

ylabel('ISWR');

title('Current Standing-Wave Pattern');