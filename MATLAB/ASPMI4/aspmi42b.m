% ASPMI Exercise 4.2b
% Implement the CLMS algorithm and plot the time-frequency spectrum.

% Generate FM signal
N = 1500;
fs = 1000; % 1kHz sampling frequency
% Generate f
f = zeros(N,1);
f(1:500) = 100; % 1 ? n ? 500
% 501 <= n <= 1000
for n = 501:1000
    f(n) = 100 + (n-500)/2;
end
% 1001 <= n <= 1500
for n = 1001:1500
    f(n) = 100 + ((n-1000)/25)^2;
end

% Plot frequency variation
figure(1)
n = 1:N;
plot(n,f)
title('Frequency Variation of FM signal')
xlabel('Step Size n')
ylabel('Frequency')
% axis([0 1500 0 400])
grid on;

% Generate phi
phi = cumsum(f);
% Generate eta - white noise with zero mean and variance = 0.05
sigma2 = 0.05;
eta = sqrt(0.05/2)*(randn(N,1)+1i*randn(N,1));
% Generate y
y = exp(1i.*2.*pi.*phi/fs) + eta;

% Use code to find AR and frequency spectrum
order = 1;
mu=0.1;
% Find estimated AR coefficients
[yhat,e,amat] = ar_clms(y(n),mu,order);
a1_hat_vec = conj(amat(2:end));
for n = 1:N
    % Run complex-valued LMS algorithm to estimate AR coefficient a1(n)
    a1_hat = a1_hat_vec(n);
    [h ,w]= freqz(1 , [1; -a1_hat], 1024); % Compute power spectrum
    H(:,n) = abs(h).^2; % Store it in a matrix
end
% Remove outliers in the matrix H
medianH = 50*median(median(H));
H(H > medianH) = medianH;
% Plot time-frequency diagram
figure(2)
title('Time-frequency plot of FM Signal')
n= 1:1500;
f = w*fs/(2*pi);
mesh(n,f,H)
view(2)
xlabel('Step Size n')
ylabel('Frequency')