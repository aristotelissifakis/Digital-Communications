function spectrum = calculateAmplitudeSpectrum(signal, period)
    % Calculate the length of the signal
    N = length(signal);
    
    % Apply the FFT to the signal
    signal_fft = fft(signal);
    
    % Calculate the single-sided amplitude spectrum
    amplitude_spectrum = abs(signal_fft(1:N/2+1));
    
    % Normalize the spectrum by dividing by the length of the signal
    amplitude_spectrum = amplitude_spectrum/N;
    
    % Return the amplitude spectrum
    spectrum = amplitude_spectrum;
end
