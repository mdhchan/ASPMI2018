% ASPMI Exercise 3.3d
% Load a single-channel EEG Data (either Cz or POz) from the file 
% EEG_Data_Assignment2.mat. As seen in the previous assignments, there is 
% a strong 50 Hz component introduced by the mains. Using the ANC 
% configuration, remove the 50 Hz component by generating a synthetic 
% reference input composed of a sinusoid of 50 Hz corrupted by white 
% Gaussian noise.  Plot the spectrum for the corrupted and denoised EEG 
% data using the spectrogram function with appropriate window length and
% overlap.

% Load EEG data
load ../EEG_data/EEG_Data_Assignment2.mat;
N = length(POz); % Length of data
t = 0:1/fs:(N-1)/fs;
nfft = 8192;
f_hs = 0:fs/N:fs/2-fs/N; % half spectrum of frequency
POz_detrend = POz - mean(POz);

% Plot spectrogram of EEG data before filtering
N_5s = fs*5; % Number of samples corresponding to 10s
win = hamming(N_5s); % Choose 10 second window

figure(1)
spectrogram(POz_detrend,win,[],nfft,fs);
title('Spectrogram of Unfiltered EEG Data')
caxis([-150 -105]);

figure(2)
pwelch(POz_detrend,win,[],nfft,fs);
axis([25 75 -inf inf]);

% Generate synthetic reference input
% Sine wave corrupted by WGN
f0 = 50;
w0 = 2*pi*f0;
Pnoise = 1e-13; % Power of the noise
x = sin(w0*t).' + sqrt(Pnoise)*randn(N,1);

% Change order but keep mu constant
mu = 0.01;
% Filter POz
order = 2;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(3)
subplot(3,1,1)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=2,\mu=0.01')
caxis([-150 -105]);

% Filter POz
order = 5;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ eta_hat,POz_filtered,amat] = anc_lms(POz_detrend,mu,order,x);

figure(3)
subplot(3,1,2)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=5,\mu=0.01')
caxis([-150 -105]);

% Filter POz
order = 20;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(3)
subplot(3,1,3)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=20,\mu=0.01')
caxis([-150 -105]);

% Change mu but keep order constant
order = 5;
% Filter POz, changing mu
mu = 0.5;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ eta_hat,POz_filtered,amat] = anc_lms(POz_detrend,mu,order,x);

figure(4)
subplot(3,1,1)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=5,\mu=0.5')
caxis([-150 -105]);

% Filter POz
mu = 0.1;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(4)
subplot(3,1,2)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=5,\mu=0.1')
caxis([-150 -105]);

% Filter POz
mu = 0.01;
[ ~,POz_filtered,~] = general_lms(POz_detrend,x,mu,order);
% [ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(4)
subplot(3,1,3)
spectrogram(POz_filtered,win,[],nfft,fs);
title('Order=5,\mu=0.01')
caxis([-150 -105]);