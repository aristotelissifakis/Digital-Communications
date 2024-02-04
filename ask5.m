% Signal parameters
f_start = 500; % Starting frequency
f_end = 3000; % Ending frequency
f_step = 100; % Frequency step

% Time parameters
f_max = f_end; % Fastest component frequency
T_min = 1/f_max; % Minimum period
duration = 10*T_min; % Duration of observation (10 times the minimum period)
dt = 1/(10*f_end); % Elementary time variation (based on fastest component)

% Time axis
t = 0:dt:duration;

% Information signal generation
info_signal = zeros(size(t));
frequencies = f_start:f_step:f_end;
for f = frequencies
    info_signal = info_signal + cos(2*pi*f*t);
end

% Plot the information signal
figure;
plot(t, info_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Information Signal');
ylim([-length(frequencies), length(frequencies)]);

% Listen to the information signal
sound(info_signal);

% Add white Gaussian noise to the signal
SNR_db = 5; % Signal-to-noise ratio (in dB)
noisy_signal = awgn(info_signal, SNR_db, 'measured');

% Plot the noisy signal
figure;
plot(t, noisy_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal');
ylim([-length(frequencies), length(frequencies)]);

% Listen to the noisy signal
sound(noisy_signal);

% Plot the amplitude spectrum of the information signal
info_spectrum = calculateAmplitudeSpectrum(info_signal, dt);
frequency_info = (0:(length(info_spectrum)-1))/(duration);
figure;
plot(frequency_info, info_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum - Information Signal');

% Plot the amplitude spectrum of the noisy signal
noisy_spectrum = calculateAmplitudeSpectrum(noisy_signal, dt);
frequency_noisy = (0:(length(noisy_spectrum)-1))/(duration);
figure;
plot(frequency_noisy, noisy_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum - Noisy Signal');
