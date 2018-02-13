% ASPMI Part 1.3c
% Make rectangular-windowed periodogram of x[n] with varying a2
f0=0.2;
a1 = 1;

phi1 = 0;
phi2 = 0;
N = 256;
win = rectwin(N);

n = 0:N-1;
w = 0; % 0 variance

% Find periodograms for alpha=4
alpha = 4;

% Find periodogram for a2=1
a2 = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
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