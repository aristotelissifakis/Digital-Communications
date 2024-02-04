% Signal parameters
Am = 0.5;               % Amplitude of the baseband signal (V)
fm = 2;                 % Frequency of the baseband signal (Hz)
fc = 100;               % Carrier frequency (Hz)
fs = 400;               % Sampling frequency (Hz)
t = 0:0.001:1;          % Time axis

% Generate the baseband signal
s = Am * sin(2*pi*fm*t);

% Generate the AM signal manually
x1 = (1 + s) .* cos(2*pi*fc*t);

% Modulate the baseband signal using ammod() function
x2 = ammod(s, fc, fs);

% Plot the modulated signal and its envelope
figure;
plot(t, x1, 'b', t, abs(x1), 'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Signal (x1(t)) and Envelope');
legend('x1(t)', 'Envelope');

% Plot the modulated signal obtained from ammod() function
figure;
plot(t, x2);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Signal (x2(t))');

% Listen to the modulated signals
sound(x1, fs);
sound(x2, fs);


