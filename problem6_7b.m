clear, clc;

% Model Parameters
R1 = 0.1;
X1 = 0.21;
R2 = 0.07;
X2 = 0.21;
Xm = 10;

% Rated Values

V_phase = 208 / sqrt(3);
n_sync = 1800;
w_sync = 188.5;

% Thevenin Equivalent
V_th = V_phase * (Xm / sqrt(R1^2 + (X1 + Xm)^2));
Z_th = ((j*Xm) * (R1 + j*X1)) / (R1 + j*(X1 + Xm));
R_th = real(Z_th);
X_th = imag(Z_th);

% Slip and Mechanical SPeed 
s = (0:1:50) / 50;
s(1) = 0.001;
nm = (1-s) * n_sync;
wm = (1-s) * w_sync;

% Torque vs speed
for k = 1:51
    t_ind(k) = (3 * V_th^2 * R2/s(k)) / (w_sync * ((R_th + R2/s(k))^2 + (X_th + X2)^2));
    P_out(k) = t_ind(k) * wm(k);
end

% Torque-speed curve
figure(1);
plot(nm,P_out/1000);
xlabel('n_{m}');
ylabel('P_{out}');
title('Induction Motor Output Power vs. Speed');
grid on;
