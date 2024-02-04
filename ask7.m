% Information signal parameters
info_start_freq = 500;    % Starting frequency of the information signal (Hz)
info_freq_step = 100;     % Frequency step of the information signal (Hz)
info_end_freq = 3000;     % Ending frequency of the information signal (Hz)

% Carrier signal parameters
carrier_freq = 100000;    % Carrier frequency (Hz)

% Sampling frequency
fs = 10 * carrier_freq;   % Choose a sampling frequency at least 10 times the carrier frequency

% Time axis
t = 0:(1/fs):1;           % Time duration of 1 second

% Generate the information signal
info_signal = zeros(1, length(t));
freqs = info_start_freq:info_freq_step:info_end_freq;
for freq = freqs
    info_signal = info_signal + cos(2*pi*freq*t);
end

% Perform DSB modulation
usb_modulated_signal = info_signal .* cos(2*pi*carrier_freq*t);   % Upper sideband modulation
lsb_modulated_signal = info_signal .* cos(2*pi*carrier_freq*t + pi);   % Lower sideband modulation

% Bandpass filter parameters
f1 = carrier_freq - info_end_freq;     % Lower bound of the bandpass filter
f2 = carrier_freq + info_end_freq;     % Upper bound of the bandpass filter

% Apply bandpass filtering to the USB modulated signal
usb_filtered_signal = bpfilt(usb_modulated_signal, f1, f2, fs);

% Apply bandpass filtering to the LSB modulated signal
lsb_filtered_signal = bpfilt(lsb_modulated_signal, f1, f2, fs);

% Plot the amplitude spectra of all signals
figure;
subplot(4,1,1);
plot_spectrum(info_signal, fs, 'Information Signal');
subplot(4,1,2);
plot_spectrum(usb_modulated_signal, fs, 'USB Modulated Signal');
subplot(4,1,3);
plot_spectrum(lsb_modulated_signal, fs, 'LSB Modulated Signal');
subplot(4,1,4);
plot_spectrum(usb_filtered_signal, fs, 'USB Filtered Signal');

% Function for plotting the amplitude spectrum
function plot_spectrum(signal, fs, title_str)
    spectrum = abs(fftshift(fft(signal)))/length(signal);
    freq = (-fs/2):(fs/length(signal)):(fs/2 - fs/length(signal));
    plot(freq, spectrum);
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    title(title_str);
end

% Function for bandpass filtering
function y = bpfilt(signal, f1, f2, fs)
    % bandpass filtering
    if isrow(signal)
        signal = signal.';
    end
    N = length(signal);
    dF = fs / N;
    f = (-fs/2 : dF : fs/2 - dF).';
    if isempty(f1) || f1 == -Inf
        BPF = (abs(f) < f2);
    elseif isempty(f2) || f2 == Inf
        BPF = (f1 < abs(f));
    else
        BPF = ((f1 < abs(f)) & (abs(f) < f2));
    end
    spectrum = fftshift(fft(signal)) / N;
    spectrum = BPF .* spectrum;
    y = ifft(ifftshift(spectrum)) * N;
    y = real(y);
end
