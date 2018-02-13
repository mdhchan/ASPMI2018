% ASPMI Part 1.3f
% Make Chebyshev windowed periodogram of x[n] with varying a2
f0=0.2;
a1 = 1;

phi1 = 0;
phi2 = 0;
N = 256;

n = 0:N-1;
w = 0; % 0 variance

% Find periodograms for alpha=4
alpha = 4;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
win = chebwin(N,50);
figure(1)
subplot(2,2,1)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=1')

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(1)
subplot(2,2,2)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.1')

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(1)
subplot(2,2,3)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.01')

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(1)
subplot(2,2,4)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.001')

% Find periodograms for alpha=12
alpha = 12;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(2)
subplot(2,2,1)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=1')

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(2)
subplot(2,2,2)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.1')

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(2)
subplot(2,2,3)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.01')

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
figure(2)
subplot(2,2,4)
periodogram(x,win);
title('Periodogram PSD estimate for a_2=0.001')

%%%%%%%%%%%%%%%% Use Blackman-Tukey method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find periodograms for alpha=4
alpha = 4;
N = 200; % Throw away some samples
fn = 0:2*1/200:1-1/200;
win_bt = chebwin(N,50);

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,1)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,2)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(3)
subplot(2,2,3)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-15;
figure(3)
subplot(2,2,4)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodograms for alpha=12
alpha = 12;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,1)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=1')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.1
a2 = 0.1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,2)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.1')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.01
a2 = 0.01;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,3)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.01')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')

% Find periodogram for a2=0.001
a2 = 0.001;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
acf_x = xcorr(x,'biased');
acf_x = acf_x(156:355);
fft_acf_x = fft(win_bt.*transpose(acf_x));
fft_acf_x = fft_acf_x + 10e-13;
figure(4)
subplot(2,2,4)
plot(fn,10*log10(abs(fft_acf_x(1:100))))
title('Blackman-Tukey PSD estimate for a_2=0.001')
xlabel('Normalised Frequency (\times\pi rad/sample)')
ylabel('Power/frequency (dB/rad/sample)')