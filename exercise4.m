% Exercise 4: Compare the DTFT and DFT
x = [1 1 1 1];
n = 0:length(x)-1;

% 1. DTFT at 1000 frequency values between -pi and pi
w = linspace(-pi, pi, 1000);
X_dtft = x * exp(-1j * (n.' * w));

% 2. DFT using fft(x,4) and fft(x,64)
X_dft4 = fft(x, 4);
X_dft64 = fft(x, 64);

figure('Name', 'Exercise 4: DTFT and DFT Comparison', 'Position', [100, 100, 900, 600]);

plot(w, abs(X_dtft), 'b-', 'LineWidth', 1.5);
hold on;

% DFT 4 points (centered using fftshift)
w_dft4_cent = (-2:1)*(2*pi/4);
plot(w_dft4_cent, abs(fftshift(X_dft4)), 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);

% DFT 64 points (centered using fftshift)
w_dft64_cent = linspace(-pi, pi, 65); w_dft64_cent(end) = [];
plot(w_dft64_cent, abs(fftshift(X_dft64)), 'g--', 'LineWidth', 1.2);

grid on;
xlabel('Angular frequency (rad/sample)');
ylabel('Magnitude');
title('Comparison of DTFT and DFT Magnitudes');
legend('DTFT (Continuous)', '4-point DFT', '64-point DFT (Zero-padded)', 'Location', 'northeast');
hold off;

saveas(gcf, 'dtft-dft-comparison.png');