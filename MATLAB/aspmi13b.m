% ASPMI Part 1.3b
% Make Bartlett-windowed periodogram of x[n]
f0=0.2;
a1 = 1;
a2 = 1;
phi1 = 0;
phi2 = 0;
N = 256;

n = 0:N-1;
w = 0; % 0 variance

% Find periodogram for alpha=10
alpha = 10;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
win = bartlett(N);
figure(1)
subplot(1,3,1)
periodogram(x,win);
title('Periodogram PSD estimate for \alpha=10')

% Find periodogram for alpha=4
% could it be 3
alpha = 4;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
win = bartlett(N);
figure(1)
subplot(1,3,2)
periodogram(x,win);
title('Periodogram PSD estimate for \alpha=4')

% Find periodogram for alpha=1
alpha = 1;
x = a1*sin(f0*2*pi*n+phi1)+a2*sin((f0+alpha/N)*2*pi*n+phi2)+w;
win = bartlett(N);
figure(1)
subplot(1,3,3)
periodogram(x,win);
title('Periodogram PSD estimate for \alpha=1')