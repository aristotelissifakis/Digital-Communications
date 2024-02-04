fs = 6000;
ts = 1/fs;
t = 0:ts:1;
fr = [1567 1760 1975 1046];
x = zeros(length(fr), length(t));
for i = 1:length(fr)
    x(i, :) = cos(2*pi*fr(i)*t);
end
xx = [x(1, :) x(2, :) x(3, :) x(4, :)];

% Plot the melody signal
time = 0:ts:(length(xx)-1)*ts;
figure;
plot(time, xx);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal');

% Listen to the melody signal
sound(xx, fs);

% Calculate and plot the amplitude spectrum of the melody signal
spectrum = calculateAmplitudeSpectrum(xx, ts);
frequency = (0:(length(spectrum)-1))/(length(spectrum)*ts);
figure;
plot(frequency, spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Melody Signal Amplitude Spectrum');
