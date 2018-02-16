% ASPMI Exercise 2.2b
% Generate 10000 samples of data in MATLAB, according to an AR(4) equation
% x[n] where w ~ N (0, 1) and discard the first 500 samples (x=x(500:end))
% to remove the transient output of the filter. Estimate the power spectrum
% density of the signal using varying model orders p = 2, ..., 14 and 
% plot the results of the model orders which produced the best results.

% Note that the denominator coefficients d are different from the 
% parameters a as defined in the problem

N = 10000;
n = 1:N;
w = randn(N,1); % Generate 1000 points of WGN
% Filter noise with AR(4) coefficients
b = 1; % No MA coefficients
a = [2.76 -3.81 2.65 -0.92];
d = [1 -1.*a];
x = filter(b,d,w);
x = x(501:end); % Discard first 500 samples

% Find true PSD
[h,w] = freqz(b,d,N/2);
PSD_true = h.^2;
PSD_dB = 10*log10(PSD_true);
% figure(1)
% plot(w,PSD_dB);
% xlabel('Angular Frequency/rad/s');
% ylabel('Power/dB');
% title('True PSD of Filtered Noise')

% To assess "best" model order, use mean-squared error
mse = zeros(length(2:14),1);
for j = 2:14
    p = j;
    [sigma2,a_hat] = estimate_allpole_param(x,p);
    P = zeros(N/2,1);
    d_hat = [1 a_hat.'];
    for i = 1:N/2
        P(i) = PSD_allpole(sigma2,w(i),d_hat);
    end
    mse(j-1) = (sum(P-PSD_true)).^2;
end

figure(4)
plot(2:14,mse);

% Find estimated PSD for p = 4
p = 4;
[sigma2,a_hat] = estimate_allpole_param(x,p);
P = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P(i) = PSD_allpole(sigma2,w(i),d_hat);
end
figure(1)
hold on;
plot(w,10*log10(P));
plot(w,PSD_dB,'r');
xlabel('Angular Frequency/rad/s');
ylabel('Power/dB');
title(['Comparison of True and Estimated PSDs of Filtered Noise for ', ...
        'p = ', num2str(p)])
legend('Estimated PSD','True PSD')

% Find estimated PSD for p = 7
p = 7;
[sigma2,a_hat] = estimate_allpole_param(x,p);
P = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P(i) = PSD_allpole(sigma2,w(i),d_hat);
end
figure(2)
hold on;
plot(w,10*log10(P));
plot(w,PSD_dB,'r');
xlabel('Angular Frequency/rad/s');
ylabel('Power/dB');
title(['Comparison of True and Estimated PSDs of Filtered Noise for ', ...
        'p = ', num2str(p)])
legend('Estimated PSD','True PSD')

% Find estimated PSD for p = 10
p = 10;
[sigma2,a_hat] = estimate_allpole_param(x,p);
P = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P(i) = PSD_allpole(sigma2,w(i),d_hat);
end
figure(3)
hold on;
plot(w,10*log10(P));
plot(w,PSD_dB,'r');
xlabel('Angular Frequency/rad/s');
ylabel('Power/dB');
title(['Comparison of True and Estimated PSDs of Filtered Noise for ', ...
        'p = ', num2str(p)])
legend('Estimated PSD','True PSD')