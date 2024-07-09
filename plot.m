% Input data
N = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048];
RM_Cycles = [69912, 67375, 69945, 72641, 70433, 82350, 109229, 219975, 695741, 2640725, 10479008, 41706325];
CM_Cycles = [82112, 108495, 66654, 75608, 71079, 90241, 119050, 285995, 1153062, 6081291, 59176483, 293295925];

% Plot RM Cycles and CM Cycles with a logarithmic X-axis
figure;
semilogx(N, RM_Cycles, 'bo-', 'LineWidth', 1.5);
hold on;
semilogx(N, CM_Cycles, 'rx-', 'LineWidth', 1.5);

% Label the axes and add a legend
xlabel('Input Size (N)');
ylabel('Cycles');
title('RM Cycles vs. CM Cycles');
legend('RM Cycles', 'CM Cycles');

% Add a grid
grid on;

% Customize the axis limits (optional)
xlim([1, 2048]);

% Display the Python times as reference points
text(N, RM_Cycles, cellstr(num2str(N')), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(N, CM_Cycles, cellstr(num2str(N')), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

hold off;
