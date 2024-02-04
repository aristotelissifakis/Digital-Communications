function ask3()
    % Define the signal parameters
    amplitude = 5;          % Amplitude of the sine wave (in volts)
    frequency = 10;         % Frequency of the sine wave (in Hz)
    duration = 0.5;         % Duration of the signal (in seconds)
    fs = 1000;              % Sampling frequency (in Hz)

    % Generate the time vector
    t = 0:1/fs:duration-1/fs;

    % Generate the sinusoidal signal
    phase = 0;  % Phase of the sine wave (in radians)
    signal = amplitude * sin(2*pi*frequency*t + phase);

    % Plot the sine wave
    figure;
    plot(t, signal);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Sine Wave');
    
    % Call the function to calculate the amplitude spectrum
    period = 1/frequency;
    spectrum = calculateAmplitudeSpectrum(signal, period);
    
    % Calculate the theoretical amplitude spectrum of the sine wave
    theoretical_spectrum = amplitude/2 * ones(size(spectrum));
    
    % Plot the amplitude spectrum
    figure;
    plot(frequency, spectrum);
    hold on;
    plot(frequency, theoretical_spectrum, 'r--');
    xlabel('Frequency (Hz)');
    ylabel('Amplitude');
    title('Amplitude Spectrum');
    legend('Measured Spectrum', 'Theoretical Spectrum');
end

function spectrum = calculateAmplitudeSpectrum(signal, period)
    % Calculate the length of the signal
    N = length(signal);
    
    % Apply the FFT to the signal
    signal_fft = fft(signal);
    
    % Calculate the single-sided amplitude spectrum
    amplitude_spectrum = abs(signal_fft(1:N/2+1));
    
    % Normalize the spectrum by dividing by the length of the signal
    amplitude_spectrum = amplitude_spectrum/N;
    
    % Generate the frequency axis for the spectrum
    frequency = (0:(N/2))/period;
    
    % Return the amplitude spectrum
    spectrum = amplitude_spectrum;
end
