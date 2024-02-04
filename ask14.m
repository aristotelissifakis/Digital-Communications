% Parameters
f1 = 100;                % Frequency in Hz
t = -0.05:0.0001:0.05;   % Time axis

% Generate m1(t) and m2(t)
m1 = sinc(2*f1*t);
m2 = sinc(4*f1*t);

% Plot the signals
figure;
subplot(2,1,1);
plot(t, m1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal m1(t)');
subplot(2,1,2);
plot(t, m2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal m2(t)');
