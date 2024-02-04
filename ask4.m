% File path or filename of the speech signal
file_path = 'C:\Users\arist\Downloads\data\3WORDS.WAV';

% Read the speech signal
[speech_signal, sample_rate] = audioread(file_path);

% Listen to the speech signal
sound(speech_signal, sample_rate);

% Plot the waveform of the signal as a function of time
time = (0:length(speech_signal)-1)/sample_rate;
figure;
plot(time, speech_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Speech Signal Waveform');

% Calculate the amplitude spectrum of the signal
period = 1/sample_rate;
spectrum = calculateAmplitudeSpectrum(speech_signal, period);

% Plot the amplitude spectrum
frequency = (0:(length(spectrum)-1))*(1/period)/length(spectrum);
figure;
plot(frequency, spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Speech Signal Amplitude Spectrum');
