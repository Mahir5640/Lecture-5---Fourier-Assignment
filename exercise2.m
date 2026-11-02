% Exercise 2: Find Two Frequencies with the FFT
fs = 200;
T = 1;
t = 0:1/fs:T-1/fs;

x = 0.8*sin(2*pi*15*t) + 0.4*sin(2*pi*40*t);

figure('Name', 'Exercise 2: Two Frequencies with FFT', 'Position', [100, 100, 900, 600]);

% Time domain plot
subplot(2, 1, 1);
plot(t, x, 'LineWidth', 1.2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain Signal');

% Frequency domain plot (Single-sided amplitude spectrum)
N = length(x);
Y = fft(x);

P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:N/2)/N;

subplot(2, 1, 2);
plot(f, P1, 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Single-Sided Amplitude Spectrum');
xlim([0, fs/2]);

saveas(gcf, 'two-frequency-spectrum.png');