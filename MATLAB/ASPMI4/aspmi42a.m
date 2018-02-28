% ASPMI Exercise 4.2a
% Generate the frequency modulated (FM) signal y(n) =
% exp(j(2*pi*phi(n)/fs))+ eta(n).  Use the aryule function find the AR(1)
% coefficient for the complete signal of length 1500, then plot the power
% spectrum of the signal.

% Generate FM signal
N = 1500;
fs = 1000; % 1kHz sampling frequency
% Generate f
f = zeros(N,1);
f(1:500) = 100; % 1 ? n ? 500
% 501 ? n ? 1000
for n = 501:1000
    f(501:1000) = 100 + (n-500)/2;
end
% 1001 ? n ? 1500
for n = 501:1000
    f(1001:1500) = 100 + ((n-1000)/25)^2;
end

% Plot frequency variation
figure(1)
n = 1:N;
plot(n,f)
title('Frequency Variation of FM signal')
xlabel('Step Size n')
ylabel('Frequency')
axis([0 1500 0 400])
grid on;

% Generate phi
phi = cumsum(f);
% Generate eta - white noise with zero mean and variance = 0.05
sigma2 = 0.05;
eta = sqrt(0.05/2)*(randn(N,1)+1i*randn(N,1));
% Generate y
y = exp(1i.*2.*pi.*phi/fs) + eta;

% Find AR coefficient using aryule
order = 1;
a = aryule(y,1);
% Plot power spectrum of the signal
[h,w] = freqz(1,a,N);
f = w*fs/(2*pi);
figure(2)
plot(f,h)
title('Power Spectrum of FM signal Using Whole Signal')
xlabel('Frequency')
ylabel('Power')
grid on;