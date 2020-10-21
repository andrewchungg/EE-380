clear, clc; 

% Definitions
EA = 7967;
i = 0:20.92:2092;
r = 0.20;
x = 2.50;

% 0.9 Lagging PF
vp_lagging = sqrt(EA^2 - (x.*i.*0.9 - r.*i.*0.6512).^2) - r.*i.*0.9 - x.*i.*0.6512;
vt_lagging = vp_lagging .* sqrt(3);

% Unity PF

vp_unity = sqrt(EA^2 - (x.*i).^2) - r.*i;
vt_unity = vp_unity .* sqrt(3);

% Leading PF 
vp_leading = sqrt(EA^2 - (x.*i.*0.9 + r.*i.*0.6512).^2) - r.*i.*0.9 + x.*i.*0.6512;
vt_leading = vp_leading .* sqrt(3);

% Plotting terminal voltage vs lead:
plot(i,abs(vt_lagging));
hold on;
plot(i,abs(vt_unity));
plot(i,abs(vt_leading));
title('Terminal voltage vs load')
xlabel('Load(A)')
ylabel('Terminal voltage (V)')
legend('0.9 PF lagging', '1.0 unity PF', '0.9 PF leading')
axis([0 2060 2500 16000])
grid on;
hold off;
