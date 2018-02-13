% ASPMI Exercise 2.1b
% Plot your estimates in dB, together with their associated standard
% deviation (again as in Fig. 1 for comparison).

N = 512; % Set N of 512

%%%%%%%%%%%%%%%%%%%%%%% Find correlograms of WGN %%%%%%%%%%%%%%%%%%%%%%%%%%

% Create matrix of 10 realisations of N-length WGN vectors
R = 10; % Number of realisations
x_wgn = randn(N,R); % Create matrix of WGN noise
% Find Biased ACF of WGN noise for all realisations
x_wgn_bacf = zeros(2*N-1,R);
for i = 1:R
    x_wgn_bacf(:,i) = xcorr(x_wgn(:,i),'biased');
end


% Plot Correlogram of WGN
% Find FFT of both ACFs
fft_x_wgn_bacf = fft(x_wgn_bacf,[],1);
% Find the magnitude of correlogram
mag_corr_x_wgn_bacf = abs(fftshift(fft_x_wgn_bacf,1));
f_hs = 0:1/(2*N):0.5-1/(2*N); % Find the half spectrum frequencies
% Find the half-spectrum magnitudes
mag_corr_x_wgn_bacf_hs = mag_corr_x_wgn_bacf(N:end,:);
% Find logarithmic power
mag_corr_x_wgn_bacf_hs_db = 10*log10(mag_corr_x_wgn_bacf_hs);
% Plot correlogram magnitude spectrum of WGN
figure(1)
subplot(2,1,1)
hold on;
h1 = plot(f_hs,mag_corr_x_wgn_bacf_hs_db,'c','LineWidth',0.25);
h2 = plot(f_hs,mean(mag_corr_x_wgn_bacf_hs_db,2),'b','LineWidth',1);
% h3 = plot(f_hs,ones(length(f_hs)),'r--','LineWidth',1,'DisplayName','P=1');
title('PSD Estimates (Different Realisations and Mean')
xlabel('Frequency/Hz')
ylabel('Power/dB')
legend(h2, 'Mean of Realisations')

subplot(2,1,2)
plot(f_hs,std(mag_corr_x_wgn_bacf_hs_db,0,2),'r','LineWidth',1);
title('Standard Deviation of PSD Estimate')
xlabel('Frequency/Hz')
ylabel('Standard Deviation')

%%%%%%%%%%%%%%%% Find correlograms of Sine Waves in WGN %%%%%%%%%%%%%%%%%%%

% Create matrix of 10 realisations of N-length vectors
R = 10; % Number of realisations
n = 1:N;
f_1 = 0.1;
f_2 = 0.25;
f_3 = 0.3;
f_4 = 0.4;
x_sw = zeros(N,R);
for i = 1:10
    % Create vector of noisy signal
    x_sw(:,i) = sin(2*pi*f_1*n).' + sin(2*pi*f_2*n).' + ...
        + sin(2*pi*f_3*n).' + sin(2*pi*f_4*n).' + ...
        randn(N,1);
end
% Find Biased ACF of WGN noise for all realisations
x_sw_bacf = zeros(2*N-1,R);
for i = 1:R
    x_sw_bacf(:,i) = xcorr(x_sw(:,i),'biased');
end


% Plot Correlogram of WGN
% Find FFT of both ACFs
fft_x_sw_bacf = fft(x_sw_bacf,[],1);
% Find the magnitude of correlogram
mag_corr_x_sw_bacf = abs(fftshift(fft_x_sw_bacf,1));
f_hs = 0:1/(2*N):0.5-1/(2*N); % Find the half spectrum frequencies
% Find the half-spectrum magnitudes
mag_corr_x_sw_bacf_hs = mag_corr_x_sw_bacf(N:end,:);
% Find logarithmic power
mag_corr_x_sw_bacf_hs_db = 10*log10(mag_corr_x_sw_bacf_hs);
% Plot correlogram magnitude spectrum of WGN
figure(2)
subplot(2,1,1)
hold on;
h1 = plot(f_hs,mag_corr_x_sw_bacf_hs_db,'c','LineWidth',0.25);
h2 = plot(f_hs,mean(mag_corr_x_sw_bacf_hs_db,2),'b','LineWidth',1);
title('PSD Estimates (Different Realisations and Mean')
xlabel('Frequency/Hz')
ylabel('Power/dB')
legend(h2, 'Mean of Realisations')

subplot(2,1,2)
plot(f_hs,std(mag_corr_x_sw_bacf_hs_db,0,2),'r','LineWidth',1);
title('Standard Deviation of PSD Estimate')
xlabel('Frequency/Hz')
ylabel('Standard Deviation')