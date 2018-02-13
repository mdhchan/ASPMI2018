% Apply periodogram to sunspot data
load sunspot.dat;
% Separate into years and data
year = sunspot(:,1);
data = sunspot(:,2);
N = length(data); % Find the length of the sunspot data
fs = 1; % Sampling Frequency in Years

% Plot time series
figure(1)
plot(year,data);
title('Time Series Plot of Sunspot Data')
xlabel('Year');
ylabel('Zurich Number');

fn = 0:1/N:1-1/N;

% Use hamming window and use Welch's method with 50% overlap
win = hamming(N/4);

% Periodogram without removing mean
figure(2)
[pxx,~] = pwelch(data,win); % Find Welch Estimate with Hamming Window
binl = length(pxx);
f = 0:0.5/binl:0.5-1/(2*binl);
pxx = pxx + 10e-13;
plot(f,10*log10(pxx));
title('Welch Periodogram Without Modification');
grid on;
xlabel('Frequency /(Cycles/Year)');
ylabel('Power/dB');

% Remove mean
data_no_mean = data - mean(data);
figure(3)
subplot(2,1,1)
[pxx,~] = pwelch(data_no_mean,win); % Find Welch Estimate with Hamming Window
binl = length(pxx);
f = 0:0.5/binl:0.5-1/(2*binl);
pxx = pxx + 10e-13;
plot(f,10*log10(pxx));
title('Welch Periodogram With Removed Mean')
grid on;
xlabel('Frequency /(Cycles/Year)');
ylabel('Power/dB');

% Detrend the data
data_detrend = detrend(data,'linear');
figure(3)
subplot(2,1,2)
[pxx,~] = pwelch(data_detrend,win); % Find Welch Estimate with Hamming Window
binl = length(pxx);
f = 0:0.5/binl:0.5-1/(2*binl);
pxx = pxx + 10e-13;
plot(f,10*log10(pxx));
title('Welch Periodogram With Removed Linear Trend')
grid on;
xlabel('Frequency /(Cycles/Year)');
ylabel('Power/dB');

% Obtain logarithm of data
data = data + 10e-13;
log_data = log(data);
% Subtract sample mean of data
log_data_no_mean = log_data - mean(log_data);
% Find plots of logarithmic data with mean present and removed
figure(4)
subplot(2,1,1)
[pxx,~] = pwelch(log_data,win); % Find Welch Estimate with Hamming Window
binl = length(pxx);
f = 0:0.5/binl:0.5-1/(2*binl);
pxx = pxx + 10e-13;
plot(f,10*log10(pxx));
title('Welch Periodogram Of Logarithmic Data')
grid on;
xlabel('Frequency /(Cycles/Year)');
ylabel('Power/dB');
subplot(2,1,2)
[pxx,~] = pwelch(log_data_no_mean,win); % Find Welch Estimate with Hamming Window
binl = length(pxx);
f = 0:0.5/binl:0.5-1/(2*binl);
pxx = pxx + 10e-13;
plot(f,10*log10(pxx));
title('Welch Periodogram Of Logarithmic Data With Mean Removed')
grid on;
xlabel('Frequency /(Cycles/Year)');
ylabel('Power/dB');