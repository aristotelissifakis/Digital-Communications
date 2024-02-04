% Signal parameters
t = 0:0.001:0.5;          % Time axis

% Generate the noise signal
noise_signal = randn(size(t));

% Quantization levels
quant_levels_8 = linspace(min(noise_signal), max(noise_signal), 8);
quant_levels_16 = linspace(min(noise_signal), max(noise_signal), 16);

% Quantize the noise signal to 8 levels
quantized_signal_8 = quantize(noise_signal, quant_levels_8);

% Quantize the noise signal to 16 levels
quantized_signal_16 = quantize(noise_signal, quant_levels_16);

% Plot the original signal, quantized signals, quantization levels, and quantization error
figure;
subplot(2,1,1);
plot(t, noise_signal, 'b');
hold on;
plot(t, quantized_signal_8, 'r');
plot(t, quantized_signal_16, 'g');
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal and Quantized Signals');
legend('Original Signal', 'Quantized (8 levels)', 'Quantized (16 levels)');
hold off;

subplot(2,1,2);
plot(t, noise_signal - quantized_signal_8, 'r');
hold on;
plot(t, noise_signal - quantized_signal_16, 'g');
xlabel('Time (s)');
ylabel('Amplitude');
title('Quantization Error');
legend('Error (8 levels)', 'Error (16 levels)');
hold off;

% Function to perform quantization
function quantized_signal = quantize(signal, levels)
    % Calculate the quantization step size
    step_size = levels(2) - levels(1);
    
    % Quantize the signal to the nearest quantization level
    quantized_signal = levels(round((signal - min(levels)) / step_size) + 1);
end
