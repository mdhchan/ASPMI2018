% ASPMI Part 1.3c
% Make Hamming-windowed periodogram of x[n]
f0=0.2;
a1 = 1;
a2 = 1;
phi1 = 0;
phi2 = 0;
N = 256;

n = 0:N-1;
n = n.';
wnoise = 0; % 0 variance noise
nfft = 2048;
win = hamming(N);

% Find periodogram for alpha=10
alpha = 10;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
% Find 3dB threshold
pmax = max(pxx);
pmax_db = 10*log(pmax);
threshold = pmax_db - 3;
figure(1)
subplot(3,1,1)
hold on;
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for \alpha=10')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -190 30])

% Find periodogram for alpha=1
alpha = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
% Find 3dB threshold
pmax = max(pxx);
pmax_db = 10*log(pmax);
threshold = pmax_db - 3;
figure(1)
subplot(3,1,2)
hold on;
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for \alpha=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -190 30])

% Find periodogram for alpha=0.5
alpha = 0.5;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
% Find 3dB threshold
pmax = max(pxx);
pmax_db = 10*log(pmax);
threshold = pmax_db - 3;
figure(1)
subplot(3,1,3)
hold on;
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for \alpha=0.5')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 40])