% Parameters
num_sequences = 1000;    % Number of random sequences
sequence_length = 512;  % Length of each sequence
sigma = 2;              % Standard deviation

% Generate random white Gaussian noise processes
v = sigma * randn(num_sequences, sequence_length);

% Calculate the periodogram for each sequence
V = zeros(num_sequences, sequence_length);
for i = 1:num_sequences
    V(i,:) = abs(fft(v(i,:))).^2 / sequence_length;
end

% Calculate the average PSD
average_psd = mean(V, 1);

% Plot the average PSD
frequency = (0:sequence_length-1) / sequence_length;
plot(frequency, average_psd);
xlabel('Normalized Frequency');
ylabel('Power Spectral Density');
title('Average Power Spectral Density');
