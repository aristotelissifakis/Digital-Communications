% Parameters
f1 = 100;                % Frequency in Hz
fc = 600;                % Carrier frequency in Hz
t = -0.05:0.0001:0.05;   % Time axis

% Generate m(t)
m = sinc(2*f1*t);

% Calculate the number of points for FFT
N = length(t);
Nf = 2^ceil(log2(N));

% Compute the spectrum of m(t)
spectrum = abs(fftshift(fft(m, Nf)));

% Generate the frequency axis
df = 1 / (t(2) - t(1));
f = (-Nf/2 : Nf/2 - 1) * df / Nf;

% Plot the spectrum of m(t)
figure;
plot(f, spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectrum of m(t)');

% Modulate the signal
modulated_signal = m .* cos(2*pi*fc*t);

% Compute the spectrum of the modulated signal
modulated_spectrum = abs(fftshift(fft(modulated_signal, Nf)));

% Plot the modulated signal and its spectrum
figure;
subplot(2,1,1);
plot(t, modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Modulated Signal');
subplot(2,1,2);
plot(f, modulated_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Spectrum of Modulated Signal');
