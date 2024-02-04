% Parameters
SNRdB = 25;              % Signal-to-Noise Ratio (dB)
SNR = 10^(SNRdB/10);     % Convert SNR from dB to linear scale

% Bandwidth frequency range
B = 1:100000;            % Bandwidth frequency range

% Calculate channel capacity
C = B * log2(1 + SNR);

% Plot channel capacity using semilogx
semilogx(B, C)
title('Channel Capacity')
xlabel('Bandwidth (Hz)')
ylabel('Capacity (bits/s)')

