% Generate a 24 Hz sine wave of length N = 100 sampled at 1000Hz
N = 100;
f = 24; % Wave frequency
fs = 1000; % Sampling frequency
t = 0:1/fs:(N-1)/fs;
x = sin(2*pi*f*t); % Sine wave in time domain

% DFT for K=100
K = 100;
DFT_100 = fft(x,K);
f_100 = 0:fs/K:(fs-1/K);
DFT_100_mag = abs(DFT_100);
% Plot DFT magnitude spectrum
figure(1)
stem(f_100,DFT_100_mag);
title('DFT for f=24Hz, K=100');
xlabel('Frequency/Hz');
ylabel('Magnitude');
axis([0 500 0 60]);

% DFT for K=1000
K = 1000;
DFT_1000 = fft(x,K);
f_1000 = 0:fs/K:(fs-1/K);
DFT_1000_mag = abs(DFT_1000);
DFT_1000_phase = angle(DFT_1000);
% Plot DFT magnitude spectra
figure(2)
stem(f_1000,DFT_1000_mag);
title('DFT for f=24Hz, K=1000');
xlabel('Frequency/Hz');
axis([0 500 0 60]);
ylabel('Magnitude');