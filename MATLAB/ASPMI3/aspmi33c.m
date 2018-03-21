% ASPMI Exercise 3.3c
% Write a MATLAB program for the adaptive noise cancellation configuration. 
% Use the MSPE measure to compare the relative performance of the ANC and 
% ALE in de-noising the noisy sinusoid.

N = 1000;
n = 1:N;
% Generate unit amplitude sinusoid of w = 0.01 pi
w = 0.01*pi;
x = sin(w*n).';
% Generate coloured noise
wgn = randn(N,1);
b = [1 0 0.5];
a = 1;
eta = filter(b,a,wgn);
s = x + eta;
epsilon = eta;

% Filter 
order = 5;
mu = 0.01;
[ eta_hat,xhat,amat] = anc_lms(s,mu,order,epsilon);

% Find MSPE of filter
MSPE_anc = mspe(x,xhat);
disp(MSPE_anc);

figure(1)
hold on;
plot(s);
plot(xhat);
xlabel('Steps')
ylabel('Amplitude')
title('Overlay of Noisy and Filtered Signal')
legend('Noisy Signal','ANC Filtered Signal');

figure(2)
subplot(2,1,1)
plot(s);
subplot(2,1,2)
plot(xhat);

figure(3)
se = (xhat - x).^2;
se0 = (s-x).^2;
hold on;
plot(10*log10(se));
plot(10*log10(se0));
xlabel('Steps')
ylabel('Squared Error/dB')
title('Overlay of Squared-Error of Noisy and Filtered Signal')
legend('Squared Error of ANC-filtered signal','Squared Error of Noisy Signal');