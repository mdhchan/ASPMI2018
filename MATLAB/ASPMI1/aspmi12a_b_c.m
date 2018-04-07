% Part 1.2a
% Demonstrates through simulation whether x as used in the brief is
% required

% Use x in the form in the brief
L = 256;
x_10 = zeros(L,1);
x_128 = zeros(L,1);
% Make x for M = 10
M = 10;
for i = 1:M
    x_10(i) = r_12(i-1,M);
    x_10(L-(i-1)) = r_12(-i,M);
end
% Make x for M = 128
M = 128;
for i = 1:M
    x_128(i) = r_12(i-1,M);
    x_128(L-(i-1)) = r_12(-i,M);
end

% Find fft for both
% Imaginary part should be neglibly small
xf_10 = fft(x_10);
xf_128 = fft(x_128);

% Find fft of M=10 without zero padding
x_10_nz = x_10;
x_10_nz(11:246)= [];
nf_10 = 0:1/20:1-1/20; % Normalised frequency
xf_10_nz = fft(x_10_nz);
% Remove imaginary part of the spectrum
xf_real_10_nz = real(xf_10_nz);
% Plot spectral estimate of xf without zero padding
figure(1)
stem(nf_10,xf_real_10_nz);
title('Spectral Estimate of PSD Without Zero Padding for M=10');
xlabel('Normalised Frequency/Hz');
ylabel('Power');

% Part 1.2b
% Remove imaginary part of the spectrum
xf_real_10 = real(xf_10);
xf_real_128 = real(xf_128);
nf = 0:1/L:1-1/L; % Normalised frequency
% Plot spectral estimate of xf
figure(2)
stem(nf,xf_real_10);
title('Spectral Estimate of PSD With Removed Imaginary Component for M=10');
xlabel('Normalised Frequency/Hz');
ylabel('Power');
figure(3)
stem(nf,xf_real_128);
title('Spectral Estimate of PSD With Removed Imaginary Component for M=128');
xlabel('Normalised Frequency/Hz');
ylabel('Power');
figure(4)
stem(nf,xf_real_128);
title('Spectral Estimate of PSD With Removed Imaginary Component for M=128');
xlabel('Normalised Frequency/Hz');
ylabel('Power');
axis([0 0.1 0 140]);

% Part 1.2c
% Repeat the above but pad zeros at the end and not the middle;
x_10_end = zeros(L,1);
x_128_end = zeros(L,1);
% Make x for M = 10
M = 10;
for i = 1:2*M-1
    x_10_end(i) = r_12(-(M-i),M);
end
% Make x for M = 128
M = 128;
for i = 1:2*M-1
    x_128_end(i) = r_12(-(M-i),M);
end
% Take the DFT for both values of M
zf_10 = fft(x_10_end);
zf_128 = fft(x_128_end);