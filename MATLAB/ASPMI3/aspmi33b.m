% ASPMI Exercise 3.3b
% Generate 1000 samples of s(n) and estimate x(n) for filter orders M = 5;
% 10; 15; 20. Use values for delta that range from the minimum value 
% determined in part (a) to delta = 25. What is the dependence (if any) 
% between the delay delta and the MSPE (i.e. how well the de-noising 
% algorithm has performed)?

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
order = 20;
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

% Find MSPE of varying orders and deltas
mu = 0.01;
% Order = 5
order = 5;
mspe_order_5 = zeros(25,1);
for delta = 1:25
    [ xhat,e,amat] = ale_lms(s,mu,order,delta);
    mspe_order_5(delta)= mspe(x,xhat);
end
% Order = 10
order = 10;
mspe_order_10 = zeros(25,1);
for delta = 1:25
    [ xhat,e,amat] = ale_lms(s,mu,order,delta);
    mspe_order_10(delta)= mspe(x,xhat);
end
% Order = 15
order = 15;
mspe_order_15 = zeros(25,1);
for delta = 1:25
    [ xhat,e,amat] = ale_lms(s,mu,order,delta);
    mspe_order_15(delta)= mspe(x,xhat);
end
% Order = 20
order = 20;
mspe_order_20 = zeros(25,1);
for delta = 1:25
    [ xhat,e,amat] = ale_lms(s,mu,order,delta);
    mspe_order_20(delta)= mspe(x,xhat);
end

figure(4)
hold on;
plot(mspe_order_5,'c');
plot(mspe_order_10,'m');
plot(mspe_order_15,'y');
plot(mspe_order_20,'k');
title('MSPE of Varying Orders Against Delay \Delta')
xlabel('Delay \Delta')
ylabel('MSPE')
legend('Order=5','Order=10','Order=15','Order=20')

% Find MSPE of varying orders for delta = 3
mu = 0.01;
delta = 3;
mspe_delta_3 = zeros(20,1);
for order = 1:20
    [ xhat,e,amat] = ale_lms(s,mu,order,delta);
    mspe_delta_3(order)= mspe(x,xhat);
end

figure(5)
plot(mspe_delta_3,'b');
title('MSPE Against Order for Delay \Delta=3');
xlabel('Order')
ylabel('MSPE')