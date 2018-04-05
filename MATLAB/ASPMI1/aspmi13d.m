% ASPMI Part 1.3c
% Make rectangular-windowed periodogram of x[n] with varying a2
f0=0.2;
a1 = 1;

phi1 = 0;
phi2 = 0;
N = 256;
win = rectwin(N);

n = 0:N-1;
wnoise = 0; % 0 variance
nfft = 2048;

% Find periodograms for alpha=4
alpha = 4;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,1)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,2)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,3)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,4)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodograms for alpha=12
alpha = 12;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,1)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,2)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,3)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+wnoise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,4)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -150 50])
