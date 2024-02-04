% Signal parameters
amplitude = 4;          % Amplitude of the sine wave (V)
frequency = 10;         % Frequency of the sine wave (Hz)
duration = 1;           % Duration of the signal (s)
sampling_rate = 1000;   % Sampling rate (samples per second)

% Time axis
t = linspace(0, duration, duration * sampling_rate);

% Generate the sine wave signal
signal = amplitude * sin(2 * pi * frequency * t);

% Quantization parameters
bit_depth = 4;                       % Number of bits for quantization
quantization_levels = 2^bit_depth;    % Number of quantization levels

% Perform quantization
quantized_signal = quantize(signal, quantization_levels);

% Calculate quantization error
quantization_error = signal - quantized_signal;

% Plot the original signal, quantized signal, and quantization error
figure;
subplot(3,1,1);
plot(t, signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(3,1,2);
plot(t, quantized_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Quantized Signal');

subplot(3,1,3);
plot(t, quantization_error);
xlabel('Time (s)');
ylabel('Amplitude');
title('Quantization Error');

% Function to perform quantization
function quantized_signal = quantize(signal, levels)
    % Calculate the quantization step size
    step_size = (max(signal) - min(signal)) / levels;
    
    % Quantize the signal to the nearest quantization level
    quantized_signal = round(signal / step_size) * step_size;
end
