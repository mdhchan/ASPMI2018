% ASPMI Exercise 3.2c
% Implement the GNGD algorithm for the system identification problem in
% part (a), plot the weight estimates and compare it with 
% Benveniste’s algorithm.

N=1000;
b1 = 0.9;

% Generate WGN with variance 0.5
wgn = sqrt(0.5)*randn(N,1);
% Filter WGN with b coefficients (MA(1)
b = [1 b1];
a = 1;
x = filter(b,a,wgn);

% Set mu to 0.1
mu = 0.1;
order = 1;
% Use Regular LMS
[~,~,w_lms] = ma_lms(x,wgn,mu,order);
% Use Benveniste GASS
[~,~,w_ben] = ma_lms_gass(x,wgn,mu,order,'Benveniste');
% Use GNGD
[~,~,w_gngd] = ma_gngd(x,wgn,mu,order);

% Find weight error vectors
w_tilde_lms = b1 - w_lms;
w_tilde_ben = b1 - w_ben;
w_tilde_gngd = b1 - w_gngd;

% Plot weight error curves for mu=0.01
figure(1)
hold on;
plot(w_tilde_lms,'c')
plot(w_tilde_ben,'b')
plot(w_tilde_gngd,'k')
axis([0 200 -inf inf])
title('Weight Error Curves for \mu=0.1')
xlabel('Steps')
ylabel('Weight Error')
legend('LMS','GASS Benveniste','GNGD')

% Set mu to 1.1
mu = 1.1;
order = 1;
% Use Regular LMS
[~,~,w_lms] = ma_lms(x,wgn,mu,order);
% Use Benveniste GASS
[~,~,w_ben] = ma_lms_gass(x,wgn,mu,order,'Benveniste');
% Use GNGD
[~,~,w_gngd] = ma_gngd(x,wgn,mu,order);

% Find weight error vectors
w_tilde_lms = b1 - w_lms;
w_tilde_ben = b1 - w_ben;
w_tilde_gngd = b1 - w_gngd;

% Plot weight error curves for mu=0.01
figure(2)
hold on;
plot(w_tilde_lms,'c')
plot(w_tilde_ben,'b')
plot(w_tilde_gngd,'k')
axis([0 200 -inf inf])
title('Weight Error Curves for \mu=1.1')
xlabel('Steps')
ylabel('Weight Error')
legend('LMS','GASS Benveniste','GNGD')

