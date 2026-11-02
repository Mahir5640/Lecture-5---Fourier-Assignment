% Exercise 3: Investigate Spectral Leakage
fs = 200;
d = 4;
f2 = 13.2 + 0.17 * d; % 13.8 Hz
f1 = 15;

% 1-second recording
T1 = 1;
t1 = 0:1/fs:T1-1/fs;
x1 = 0.8*sin(2*pi*f1*t1) + 0.4*sin(2*pi*f2*t1);

N1 = length(x1);
Y1 = fft(x1);
P1_2 = abs(Y1/N1);
P1_1 = P1_2(1:N1/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);
f_axis1 = fs*(0:N1/2)/N1;

% 4-second recording
T2 = 4;
t2 = 0:1/fs:T2-1/fs;
x2 = 0.8*sin(2*pi*f1*t2) + 0.4*sin(2*pi*f2*t2);

N2 = length(x2);
Y2 = fft(x2);
P2_2 = abs(Y2/N2);
P2_1 = P2_2(1:N2/2+1);
P2_1(2:end-1) = 2*P2_1(2:end-1);
f_axis2 = fs*(0:N2/2)/N2;

% Zero-padded spectrum (1-sec signal padded to 4x length)
Y_pad = fft(x1, 4*N1);
P_pad2 = abs(Y_pad/(4*N1));
P_pad1 = P_pad2(1:(4*N1)/2+1);
P_pad1(2:end-1) = 2*P_pad1(2:end-1);
f_axis_pad = fs*(0:(4*N1)/2)/(4*N1);

% Plotting comparison
figure('Name', 'Exercise 3: Spectral Leakage', 'Position', [100, 100, 1000, 800]);

subplot(3, 1, 1);
plot(f_axis1, P1_1, 'LineWidth', 1.2);
grid on;
xlim([0, 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('1-Second Recording (Bin spacing = 1 Hz)');

subplot(3, 1, 2);
plot(f_axis2, P2_1, 'LineWidth', 1.2);
grid on;
xlim([0, 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('4-Second Recording (Bin spacing = 0.25 Hz)');

subplot(3, 1, 3);
plot(f_axis_pad, P_pad1, 'LineWidth', 1.2);
grid on;
xlim([0, 30]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('1-Second Recording with Zero-Padding (4x)');

saveas(gcf, 'leakage-comparison.png');