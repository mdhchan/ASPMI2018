% ASPMI Exercise 2.1a
% Write a MATLAB script which calculates both biased and unbiased ACF
% estimates of a signal and then use these ACF estimates to compute the
% corresponding correlogram

N = 512; % Set N of 512

%%%%%%%%%%%%%%%%%%%%%%% Find correlograms of WGN %%%%%%%%%%%%%%%%%%%%%%%%%%

x_1 = randn(N,1); % Create vector of WGN noise
% Find Biased ACF of WGN noise
x_1_bacf = xcorr(x_1,'biased');
% Find Unbiased ACF of WGN noise
x_1_uacf = xcorr(x_1,'unbiased');

% Plot ACF for both functions
tau = -(N-1):N-1; % Find corresponding lags
figure(1)
% Plot Biased ACF
subplot(2,1,1)
stem(tau,x_1_bacf);
title('Biased ACF of WGN')
xlabel('Lags')
ylabel('Autocorrelation')
% Plot Unbiased ACF
subplot(2,1,2)
stem(tau,x_1_uacf);
title('Unbiased ACF of WGN')
xlabel('Lags')
ylabel('Autocorrelation')

% Plot Correlogram for both functions
% Find FFT of both ACFs
fft_x_1_bacf = fft(x_1_bacf);
fft_x_1_uacf = fft(x_1_uacf);
% Find the magnitude of correlograms
mag_corr_x_1_bacf = abs(fftshift(fft_x_1_bacf));
mag_corr_x_1_uacf = abs(fftshift(fft_x_1_uacf));
f_hs = 0:1/(2*N):0.5-1/(2*N); % Find the half spectrum frequencies
% Find the half-spectrum magnitudes
mag_corr_x_1_bacf_hs = mag_corr_x_1_bacf(N:end);
mag_corr_x_1_uacf_hs = mag_corr_x_1_uacf(N:end);
% Plot correlogram magnitude spectrum of WGN
figure(2)
subplot(2,1,1)
plot(f_hs,mag_corr_x_1_bacf_hs);
title('Biased ACF Correlogram of WGN')
xlabel('Frequency/Hz')
ylabel('Power')
subplot(2,1,2)
plot(f_hs,mag_corr_x_1_uacf_hs);
title('Unbiased ACF Correlogram of WGN')
xlabel('Frequency/Hz')
ylabel('Power')

%%%%%%%%%%%%%%%%%%% Find correlograms of sine wave in WGN %%%%%%%%%%%%%%%%%

n = 1:N;
f = 0.1;
x_2 = sin(2*pi*f*n).' + randn(N,1); % Create vector of noisy sine wave
% Find Biased ACF of WGN noise
x_2_bacf = xcorr(x_2,'biased');
% Find Unbiased ACF of WGN noise
x_2_uacf = xcorr(x_2,'unbiased');

% Plot ACF for both functions
tau = -(N-1):N-1; % Find corresponding lags
figure(3)
% Plot Biased ACF
subplot(2,1,1)
stem(tau,x_2_bacf);
title('Biased ACF')
xlabel('Lags')
ylabel('Autocorrelation')
% Plot Unbiased ACF
subplot(2,1,2)
stem(tau,x_2_uacf);
title('Unbiased ACF')
xlabel('Lags')
ylabel('Autocorrelation')

% Plot Correlogram for both functions
% Find FFT of both ACFs
fft_x_2_bacf = fft(x_2_bacf);
fft_x_2_uacf = fft(x_2_uacf);
% Find the magnitude of correlograms
mag_corr_x_2_bacf = abs(fftshift(fft_x_2_bacf));
mag_corr_x_2_uacf = abs(fftshift(fft_x_2_uacf));
f_hs = 0:1/(2*N):0.5-1/(2*N); % Find the half spectrum frequencies
% Find the half-spectrum magnitudes
mag_corr_x_2_bacf_hs = mag_corr_x_2_bacf(N:end);
mag_corr_x_2_uacf_hs = mag_corr_x_2_uacf(N:end);
% Plot correlogram magnitude spectrum of WGN
figure(4)
subplot(2,1,1)
plot(f_hs,mag_corr_x_2_bacf_hs);
title('Biased ACF Correlogram')
xlabel('Frequency/Hz')
ylabel('Power')
subplot(2,1,2)
plot(f_hs,mag_corr_x_2_uacf_hs);
title('Unbiased ACF Correlogram')
xlabel('Frequency/Hz')
ylabel('Power')

%%%%%%%%%%%%%%%% Find correlograms of WGN filtered by MA(5) filter %%%%%%%%

x_wgn = randn(N,1); % Create vector of WGN noise
b = [1 1 1 1 1]; % MA coefficients
a = 1; % MA only filter
x_3 = filter(b,a,x_wgn); % Create vector of filtered WGN noise
% Find Biased ACF of WGN noise
x_3_bacf = xcorr(x_3,'biased');
% Find Unbiased ACF of WGN noise
x_3_uacf = xcorr(x_3,'unbiased');

% Plot ACF for both functions
tau = -(N-1):N-1; % Find corresponding lags
figure(5)
% Plot Biased ACF
subplot(2,1,1)
stem(tau,x_3_bacf);
title('Biased ACF')
xlabel('Lags')
ylabel('Autocorrelation')
% Plot Unbiased ACF
subplot(2,1,2)
stem(tau,x_3_uacf);
title('Unbiased ACF')
xlabel('Lags')
ylabel('Autocorrelation')

% Plot Correlogram for both functions
% Find FFT of both ACFs
fft_x_3_bacf = fft(x_3_bacf);
fft_x_3_uacf = fft(x_3_uacf);
% Find the magnitude of correlograms
mag_corr_x_3_bacf = abs(fftshift(fft_x_3_bacf));
mag_corr_x_3_uacf = abs(fftshift(fft_x_3_uacf));
f_hs = 0:1/(2*N):0.5-1/(2*N); % Find the half spectrum frequencies
% Find the half-spectrum magnitudes
mag_corr_x_3_bacf_hs = mag_corr_x_3_bacf(N:end);
mag_corr_x_3_uacf_hs = mag_corr_x_3_uacf(N:end);
% Plot correlogram magnitude spectrum of WGN
figure(6)
subplot(2,1,1)
plot(f_hs,mag_corr_x_3_bacf_hs);
title('Biased ACF Correlogram')
xlabel('Frequency/Hz')
ylabel('Power')
subplot(2,1,2)
plot(f_hs,mag_corr_x_3_uacf_hs);
title('Unbiased ACF Correlogram')
xlabel('Frequency/Hz')
ylabel('Power')