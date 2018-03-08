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
N_10s = fs*10; % Number of samples corresponding to 10s
win = hamming(N_10s); % Choose 10 second window

figure(1)
spectrogram(POz_detrend,win,[],nfft,fs);

figure(2)
pwelch(POz_detrend,win,[],nfft,fs);
axis([25 75 -inf inf]);

% Generate synthetic reference input
f0 = 50;
w0 = 2*pi*f0;
x = sin(w0*t).';

% Filter POz
order = 20;
mu = 0.01;
[ eta_hat,POz_filtered,amat] = anc_lms(POz_detrend,mu,order,x);

figure(3)
spectrogram(POz_filtered,win,[],nfft,fs);

% Filter POz
order = 10;
mu = 0.01;
[ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(4)
spectrogram(POz_filtered,win,[],nfft,fs);

% Filter POz
order = 20;
mu = 0.1;
[ ~,POz_filtered,~] = anc_lms(POz_detrend,mu,order,x);

figure(5)
spectrogram(POz_filtered,win,[],nfft,fs);