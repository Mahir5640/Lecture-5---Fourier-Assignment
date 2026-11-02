% Exercise 1: Build a Square Wave from Harmonics
t = linspace(-1, 1, 4000);
H_values = [1, 3, 9, 25];
figure('Name', 'Square Wave Approximation', 'Position', [100, 100, 900, 700]);

for i = 1:length(H_values)
    H = H_values(i);
    x = zeros(size(t));
    for k = 1:2:H
        x = x + (4/pi) * sin(2*pi*k*t) / k;
    end

    subplot(2, 2, i);
    plot(t, x, 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['H = ', num2str(H)]);
    ylim([-1.5, 1.5]);
end

saveas(gcf, 'square-wave-comparison.png');