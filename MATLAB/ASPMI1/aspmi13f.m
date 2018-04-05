% ASPMI Part 1.3f
% Make Chebyshev windowed periodogram of x[n] with varying a2
f0=0.2;
a1 = 1;

phi1 = 0;
phi2 = 0;
N = 256;

n = 0:N-1;
w_noise = 0; % 0 variance
nfft = 2048;
win = chebwin(N,70);

% Find periodograms for alpha=4
alpha = 4;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,1)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,2)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,3)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(1)
subplot(2,2,4)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodograms for alpha=12
alpha = 12;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,1)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,2)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,3)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
[pxx,w] = periodogram(x,win,nfft);
f = w./pi;
figure(2)
subplot(2,2,4)
plot(f,10*log(pxx),'b');
title('Periodogram PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -200 50])

%%%%%%%%%%%%%%%% Use Blackman-Tukey method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find periodograms for alpha=4
alpha = 4;
N = 200; % Throw away some samples
fn = 0:2*1/200:1-1/200;
f = 0:2*1/nfft:1-1/nfft;
win_bt = chebwin(N,50);

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x),nfft);
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,1)
plot(f,10*log10(abs(fft_acf_x(1:nfft/2))))
title('Blackman-Tukey PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x),nfft);
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,2)
plot(f,10*log10(abs(fft_acf_x(1:nfft/2))))
title('Blackman-Tukey PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x),nfft);
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,3)
plot(f,10*log10(abs(fft_acf_x(1:nfft/2))))
title('Blackman-Tukey PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x),nfft);
fft_acf_x = fft_acf_x + 10e-15;
figure(3)
subplot(2,2,4)
plot(f,10*log10(abs(fft_acf_x(1:nfft/2))))
title('Blackman-Tukey PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodograms for alpha=12
alpha = 12;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,1)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,2)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,3)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w_noise;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,4)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times \pi rad/sample)')
ylabel('Power/dB')
axis([0 1 -20 20])