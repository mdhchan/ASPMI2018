% Part 1.2a
% The use of the fft command gives spectral estimates in the range [0, 2?]
% instead of the more convenient [??, ?]. Use the MATLAB command fftshift
% to exchange the first and second half of the FFT output to correspond to 
% the range [??, ?]. Similarly, the fftshift can be used to center the ACF 
% around the zero-lag. Experiment with this command for the exercises 
% above.

% Use x in the form in the brief
L = 256;
x_10 = zeros(L,1);
% Make x for M = 10
M = 10;
for i = 1:M
    x_10(i) = r_12(i-1,M);
    x_10(L-(i-1)) = r_12(-i,M);
end

% Find fft - imaginary part should be neglibly small
xf_10 = fft(x_10);

% Remove imaginary part of the spectrum
xf_real_10 = real(xf_10);
nf = 0:1/L:1-1/L; % Normalised frequency from 0 to 1
nf_shifted = -0.5:1/L:0.5-1/L; % Normalised frequency from -0.5 to 0.5

figure(1)
% Plot spectral estimate of xf from normalised frequencies of 0 to 1
subplot(2,1,1)
stem(nf,xf_real_10);
title('PSD Estimate for M=10 from 0 to 1');
xlabel('Normalised Frequency/Hz');
ylabel('Power');
% Plot spectral estimate of xf from normalised frequencies of -0.5 to 0.5
subplot(2,1,2)
stem(nf_shifted,fftshift(xf_real_10)); % Equivalent to plot(w,fftshift(fft(x)))
title('PSD Estimate for M=10 from -0.5 to 0.5');
xlabel('Normalised Frequency/Hz');
ylabel('Power');

% Implement stem(n,fftshift(ifft(xf))) for different time lags n
n = -L/2:L/2-1;
% Plot autocorrelation function
figure(2)
stem(n,fftshift(ifft(xf_real_10)));
title('ACF for Lags -128 to 127');
xlabel('Lag');
ylabel('Autocorrelation');

% % Make x odd
% L = 257; % Use odd L
% x_10_odd = zeros(L,1);
% % Make x for M = 10
% M = 10;
% for i = 1:M
%     x_10_odd(i) = r_12(i-1,M);
%     x_10_odd(L-(i-1)) = r_12(-(i-1),M);
% end
% % Find fft - imaginary part should be neglibly small
% xf_10_odd = fft(x_10_odd);
% 
% % Find absolute value of spectrum
% xf_real_10_odd = abs(xf_10_odd);
% nf_shifted = -0.5:1/L:0.5-1/L; % Normalised frequency from -0.5 to 0.5
% 
% figure(3)
% stem(nf_shifted,fftshift(xf_real_10_odd)); % Equivalent to plot(w,fftshift(fft(x)))
% title('Odd PSD Estimate for M=10 from -0.5 to 0.5');
% xlabel('Normalised Frequency/Hz');
% ylabel('Power');
% 
% % Implement stem(n,fftshift(ifft(xf))) for different time lags n
% n = -L/2:L/2-1;
% % Plot autocorrelation function
% figure(4)
% stem(n,fftshift(ifft(xf_real_10_odd)));
% title('ACF for Lags -128 to 127');
% xlabel('Lag');
% ylabel('Autocorrelation');