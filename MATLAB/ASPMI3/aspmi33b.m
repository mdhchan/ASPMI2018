% ASPMI Exercise 3.3b
% Generate 1000 samples of s(n) and estimate x(n) for filter orders M = 5;
% 10; 15; 20. Use values for deltathat range from the minimum value 
% determined in part (a) to delta = 25. What is the dependence (if any) 
% between the delay delta and the MSPE (i.e. how well the de-noising 
% algorithm has performed)?

% http://eceweb1.rutgers.edu/~orfanidi/osp2e/osp2e.pdf

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

% Filter 
order = 5;
mu = 0.01;
delta = 5;
[ xhat,e,amat] = ale_lms(s,mu,order,delta);

% Find MSPE of filter
MSPE_ale = mspe(x,xhat);
disp(MSPE_ale);

figure(1)
hold on;
plot(s);
plot(xhat);
legend('Noisy Signal','ALE filtered signal');

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
legend('Squared Error of ALE-filtered signal','Squared Error of Noisy Signal');