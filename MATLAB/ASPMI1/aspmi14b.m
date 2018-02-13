% Apply the standard periodogram approach to the entire recording,
% as well as the averaged periodogram with different window lengths (
% 10 s, 5 s, 1 s) to the EEG data

% Load EEG data
load EEG_data/EEG_Data_Assignment1.mat;
N = length(POz); % Length of data
t = 0:1/fs:(N-1)/fs;
f_hs = 0:fs/N:fs/2-fs/N; % half spectrum of frequency

% Plot Time series
figure(1)
plot(t,POz);
title('Time Series Plot of SSVEP Data from EEG')
xlabel('Time/seconds');
ylabel('Voltage');

win = hamming(N); % Choose window

% Plot standard periodogram
figure(2)
subplot(2,1,1)
pxx = periodogram(POz,win,N-1);
plot(f_hs,pxx); % Plot absolute values
title('Standard Periodogram of EEG Data in Absolute Scale');
grid on;
xlabel('Frequency/Hz');
ylabel('Power');

subplot(2,1,2)
pxx = pxx + 10e-13;
pxx_dB = 10*log10(pxx);
plot(f_hs,pxx_dB); % Plot logarithmic values
title('Standard Periodogram of EEG Data in Logarithmic Scale');
grid on;
xlabel('Frequency/Hz');
ylabel('Power/dB');

figure(3)
plot(f_hs,pxx_dB); % Plot logarithmic values
axis([10 20 -inf inf])
title('Standard Periodogram of EEG Data in Logarithmic Scale Zoomed To 10-20 Hz');
grid on;
xlabel('Frequency/Hz');
ylabel('Power/dB');

% Plot periodogram averaged using Welch's method
% Find window size
N_10s = fs*10; % Number of samples corresponding to 10s
N_5s = fs*5; % Number of samples corresponding to 5s
N_1s = fs*1; % Number of samples corresponding to 1s

win_10 = hamming(N_10s); % choose 10 second window
win_5 = hamming(N_5s); % choose 5 second window
win_1 = hamming(N_1s); % choose 1 second window

% Calculate periodogram values

% Calculate for window size of 10s
pxx_welch_10 = pwelch(POz,win_10,[],N-1);
pxx_welch_10 = pxx_welch_10 + 10e-13;
pxx_welch_dB_10 = 10*log10(pxx_welch_10); % Find logarithmic values

% Calculate for window size of 5s
pxx_welch_5 = pwelch(POz,win_5,[],N-1);
pxx_welch_5 = pxx_welch_5 + 10e-13;
pxx_welch_dB_5 = 10*log10(pxx_welch_5); % Find logarithmic values

% Calculate for window size of 1s
pxx_welch_1 = pwelch(POz,win_1,[],N-1);
pxx_welch_1 = pxx_welch_1 + 10e-13;
pxx_welch_dB_1 = 10*log10(pxx_welch_1); % Find logarithmic values

figure(4)

% Plot logarithmic values for window size of 10s
subplot(3,1,1)
plot(f_hs,pxx_welch_dB_10); 
axis([10 20 -inf inf])
title('Welch Periodogram of EEG Data for 10s Window');
grid on;
xlabel('Frequency/Hz');
ylabel('Power/dB');


% Plot logarithmic values for window size of 5s
subplot(3,1,2)
plot(f_hs,pxx_welch_dB_5); 
axis([10 20 -inf inf])
title('Welch Periodogram of EEG Data for 5s Window');
grid on;
xlabel('Frequency/Hz');
ylabel('Power/dB');

% Plot logarithmic values for window size of 1s
subplot(3,1,3)
plot(f_hs,pxx_welch_dB_1); 
axis([10 20 -inf inf])
title('Welch Periodogram of EEG Data for 1s Window');
grid on;
xlabel('Frequency/Hz');
ylabel('Power/dB');

% figure(3)
% subplot(2,1,1)
% plot(f_hs,pxx_welch); % Plot absolute values
% axis([10 20 0 inf])
% 
% subplot(2,1,2)
% pxx_welch = pxx_welch + 10e-13;
% pxx_welch_dB = 10*log10(pxx_welch);
% plot(f_hs,pxx_welch_dB); % Plot logarithmic values
% axis([10 20 -inf inf])