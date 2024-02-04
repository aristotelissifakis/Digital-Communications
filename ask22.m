% Generate and display 16QAM modulated data with SNR=5dB
data = randi([0 15], 1000, 1);
modulatedData = qammod(data, 16);
SNR_dB = 5;
noisyData = awgn(modulatedData, SNR_dB, 'measured');

figure;
subplot(1, 2, 1);
scatterplot(modulatedData);
title('16QAM Modulated Data');
xlabel('In-Phase');
ylabel('Quadrature');

subplot(1, 2, 2);
scatterplot(noisyData);
title('16QAM Modulated Data with SNR=5dB');
xlabel('In-Phase');
ylabel('Quadrature');

% Generate and display 4QAM modulated data with SNR=20dB
data = randi([0 3], 1000, 1);
modulatedData = qammod(data, 4);
SNR_dB = 20;
noisyData = awgn(modulatedData, SNR_dB, 'measured');

figure;
subplot(1, 2, 1);
scatterplot(modulatedData);
title('4QAM Modulated Data');
xlabel('In-Phase');
ylabel('Quadrature');

subplot(1, 2, 2);
scatterplot(noisyData);
title('4QAM Modulated Data with SNR=20dB');
xlabel('In-Phase');
ylabel('Quadrature');
