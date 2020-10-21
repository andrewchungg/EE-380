clear, clc;

EA1 = 14858;
EA2 = (0.55:0.01:1.00)*EA1;
Vp = 8313;
d1 = 26.54*pi/180; 
Xs = 2.07;
d2 = asin(EA1 ./ EA2 .* sin(d1));
EA2 = EA2 .* (cos(d2) + j.*sin(d2));
IA2 = (EA2 - Vp) ./ (j*Xs);

% Plot
figure(1)
plot(abs(EA2)/1000,abs(IA2))
title('Armature current vs E_{A}')
xlabel('E_{A} (kV)')
ylabel('I_{A} (A)')
grid on;
hold off;
