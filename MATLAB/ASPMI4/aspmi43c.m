% ASPMI Exercise 4.3c
% Implement the DFT-CLMS algorithm given in (54) for the frequency 
% modulated signal from Part 4.2 a). Plot the magnitude of the weight
% vector w(n) at every time instant to create a time-frequency diagram
% as in Part 4.2 b).

% Generate FM signal
N = 1500;
fs = 1000; % 1kHz sampling frequency
% Generate f
f = zeros(N,1);
f(1:500) = 100; % 1 < n < 500
% 501 <= n <= 1000
for n = 501:1000
    f(501:1000) = 100 + (n-500)/2;
end
% 1001 <= n <= 1500
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

% Use DFT-CLMS algorithm
bins = 1024;
mu = 0.01;
[ yhat,e,wmat] = dft_clms(y,mu,bins);
wmat = wmat(:,2:end);
H = abs(wmat);

% Plot time-frequency diagram
figure(2)
title('Time-frequency plot of FM Signal')
n= 1:1500;
f = 0:fs/bins:fs-fs/bins;
mesh(n,f,H)
xlabel('Step Size n')
ylabel('Frequency')
axis([0 1500 0 500 -inf inf])
view(2)