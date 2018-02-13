% ASPMI Exercise 2.1d
% Familiarise yourself with the generation of complex exponential signals,
% and generate signals of different frequencies and length. Verify that by
% considering more data samples the periodogram starts showing the correct
% line spectra.

%%%%% Example from exercise; closely spaced sine waves at 0.3 and 0.32 %%%%
n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

% Find periodogram
figure(1)
periodogram(x);

%%%%%%%%%%%%%% Sine waves in noise that are further away %%%%%%%%%%%%%%%%%%
n = 0:30;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x_2 = exp(1j*2*pi*0.2*n)+exp(1j*2*pi*0.3*n)+ noise;

% Find periodogram
figure(2)
periodogram(x_2);

%%%%%%%%%%%%% Closely spaced sine waves with a greater length %%%%%%%%%%%%%
n = 0:100;
noise = 0.2/sqrt(2)*(randn(size(n))+1j*randn(size(n)));
x_3 = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n)+ noise;

% Find periodogram
figure(3)
periodogram(x_3);