% 1.2 Show analytically and through simulations that the definition of PSD 
% in (7) is equivalent to that in (9) under a mild assumption that the 
% covariance sequence r(k) decays rapidly

fs = 50; % Sampling frequency of both simulations

% Use a simple function as basis for simulation
N = 500; % Select initial value of N
simple_func = zeros(1,N);
t = 0:1/fs:(N-1)/fs;
for i = 1:N
    if(t(i) <= 1)
        simple_func(i) = 1-t(i);
    end
end

% Find autocorrelation
R_sf_hat = xcorr(simple_func,'unbiased'); % Find unbiased estimate
maxlag = length(t) - 1; % Find Maximum lag
tau = -maxlag:maxlag;
figure(1)
stem(tau, R_sf_hat);
axis([-80 80 -inf inf]);
title('ACF of Simple Function');
xlabel('Lags');
ylabel('Autocorrelation');

% Plot PSD for N=500
N = 500; % Select initial value of N
simple_func = zeros(1,N);
t = 0:1/fs:(N-1)/fs;
for i = 1:N
    if(t(i) <= 1)
        simple_func(i) = 1-t(i);
    end
end
f = 0:fs/N:fs-1/N;
fft_power_sf = fft(simple_func).*conj(fft(simple_func))/N;
figure(2)
subplot(3,1,1)
stem(f,fft_power_sf);

% Plot PSD for N=1000
N = 1000; % Select initial value of N
simple_func = zeros(1,N);
t = 0:1/fs:(N-1)/fs;
for i = 1:N
    if(t(i) <= 1)
        simple_func(i) = 1-t(i);
    end
end
f = 0:fs/N:fs-1/N;
fft_power_sf_2 = fft(simple_func).*conj(fft(simple_func))/N;
figure(2)
subplot(3,1,2)
stem(f,fft_power_sf_2);

% Plot PSD for N=2000
N = 1000; % Select initial value of N
simple_func = zeros(1,N);
t = 0:1/fs:(N-1)/fs;
for i = 1:N
    if(t(i) <= 1)
        simple_func(i) = 1-t(i);
    end
end
f = 0:fs/N:fs-1/N;
fft_power_sf_3 = fft(simple_func).*conj(fft(simple_func))/N;
figure(2)
subplot(3,1,3)
stem(f,fft_power_sf_3);

% Provide a simulation for the case when this equivalence does not hold.
% Explain the reasons.
N = 500; % Select initial value of N
t = 0:1/fs:(N-1)/fs;
f_wave = 2; % Frequency of wave
wave = sin(2*pi*f_wave*t) + 2*randn(1,N);

% Find autocorrelation
R_wave_hat = xcorr(wave,'unbiased'); % Find unbiased estimate
maxlag = length(t) - 1; % Find Maximum lag
tau = -maxlag:maxlag;
figure(3)
stem(tau, R_wave_hat);
axis([-40 40 -inf inf]);
title('ACF of a Sine Wave');
xlabel('Lags');
ylabel('Autocorrelation');

% Plot PSD for N=500
N = 500;
t = 0:1/fs:(N-1)/fs;
wave = sin(2*pi*f_wave*t) + 2*randn(1,N);
fft_power_sf = fft(wave).*conj(fft(wave))/N;
f = 0:fs/N:fs-1/N;
figure(4)
subplot(3,1,1)
stem(f,fft_power_sf);

% Plot PSD for N=1000
N = 1000;
t = 0:1/fs:(N-1)/fs;
wave = sin(2*pi*f_wave*t) + 2*randn(1,N);
fft_power_2 = fft(wave).*conj(fft(wave))/N;
f = 0:fs/N:fs-1/N;
figure(4)
subplot(3,1,2)
stem(f,fft_power_2);

% Plot PSD for N=2000
N = 2000;
t = 0:1/fs:(N-1)/fs;
wave = sin(2*pi*f_wave*t) + 2*randn(1,N);
fft_power_3 = fft(wave).*conj(fft(wave))/N;
f = 0:fs/N:fs-1/N;
figure(4)
subplot(3,1,3)
stem(f,fft_power_3);