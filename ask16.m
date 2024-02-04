% Parameters
Am = 0.5;        % Amplitude of information signal
fa = 1000;       % Frequency of information signal (Hz)
AC = 2.5;        % Amplitude of carrier signal
fc = 10 * fa;    % Frequency of carrier signal (Hz)
T = 5 * (1/fa);  % Time duration

% Time axis
dt = 0.0001;     % Time step
t = 0:dt:T;      % Time vector

% Generate information signal (x(t))
x = Am * sinc(2*fa*t);

% Generate carrier signal (y(t))
y = AC * cos(2*pi*fc*t);

% Modulate carrier signal with information signal (z(t))
z = y .* x;

% Perform DSB demodulation
lo = cos(2*pi*fc*t);  % Local oscillator
demodulated_signal = butterworth_filter(z .* lo, dt, 5, 2*fa, fc);

% Plotting
figure

% Subplot 1: Original information signal (x(t))
subplot(3,1,1)
plot(t, x)
title('Original Information Signal')
xlabel('Time (s)')
ylabel('Amplitude')

% Subplot 2: Carrier signal (y(t))
subplot(3,1,2)
plot(t, y)
title('Carrier Signal')
xlabel('Time (s)')
ylabel('Amplitude')

% Subplot 3: Modulated signal (z(t))
subplot(3,1,3)
plot(t, z)
title('Modulated Signal')
xlabel('Time (s)')
ylabel('Amplitude')

% New figure for demodulated signal
figure
hold on

% Plot original information signal
plot(t, x, 'b', 'LineWidth', 1.5)

% Plot demodulated signal after filter
plot(t, demodulated_signal, 'r', 'LineWidth', 1.5)

title('Demodulated Signal')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Original Signal', 'Demodulated Signal')
hold off

% Function for Butterworth filter
function filtered_signal = butterworth_filter(signal, dt, order, fcut, fcenter)
    % Design Butterworth filter
    fs = 1 / dt;
    nyquist = fs / 2;
    normalized_fc = fcut / nyquist;
    [b, a] = butter(order, normalized_fc);
    
    % Filter the signal
    filtered_signal = filtfilt(b, a, signal);
    
    % Shift the filtered signal to the center frequency
    t = (0:length(signal)-1) * dt;
    carrier = cos(2*pi*fcenter*t);
    filtered_signal = filtered_signal .* carrier;
end

