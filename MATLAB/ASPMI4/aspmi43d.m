% ASPMI Exercise 4.3d
% Implement the DFT-CLMS for the EEG signal POz used in Part 1.4.

% Load EEG data
load ../EEG_data/EEG_Data_Assignment1.mat;
N = 1200; % Length of data
% Choose samples from 8000 to 9200
a = 8000;
POz_reduced = POz(a+1:a+N);
t = 0:1/fs:(N-1)/fs;

% Use DFT-CLMS algorithm
bins = 4096;
mu = 0.1;
lambda = 1;
[ yhat,e,wmat] = dft_clms(POz_reduced,mu,bins,lambda);
wmat = wmat(:,2:end);
H = abs(wmat).^2;
H_db = 10*log10(H);

% Plot time-frequency diagram
figure(1)
title('Time-frequency plot of EEG Signal')
n= 1:1500;
f = 0:fs/bins:fs-fs/bins;
mesh(t,f,H_db)
xlabel('Time/s')
ylabel('Frequency/Hz')
view(2)
colorbar;

figure(2)
title('Time-frequency plot of EEG Signal Zoomed')
n= 1:1500;
f = 0:fs/bins:fs-fs/bins;
mesh(t,f,H_db)
xlabel('Time/s')
ylabel('Frequency/Hz')
axis([0 N/fs 0 100 -inf inf])
view(2)
colorbar;
