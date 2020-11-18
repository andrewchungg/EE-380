clear, clc;

EA1 = 406;
d1 = -17.8 * pi/180;
EA1 = EA1 * (cos(d1) + j * sin(d1));
Xs = 0.6;
Vp = 480;
EA2 = (0.9:0.01:1.7) * 406;

d2 = asin(abs(EA1)./abs(EA2).*sin(d1));

EA2 = EA2 .* (cos(d2) + j .* sin(d2));

IA2 = (Vp-EA2) / (j*Xs);

figure(1)
    plot(abs(EA2),abs(IA2))
    xlabel('E_{A} (V)')
    ylabel('I_{A} (A)')
    title('Synchronous Motor V-Curve')
    grid on;
    
