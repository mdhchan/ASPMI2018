% ASPMI Exercise 3.1f
% Implement the leaky LMS algorithm (with different values for gamma and mu
% to estimate the AR coefficients of the signal given in Part a).

N=1000;
b1 = 0.9;

% Generate WGN with variance 0.5
wgn = sqrt(0.5)*randn(N,1);
% Filter WGN with b coefficients (MA(1)
b = [1 b1];
a = 1;
x = filter(b,a,wgn);

% Set mu to 0.01
mu = 0.01;
order = 1;
% Use regular LMS
[~,~,w_lms] = ma_lms(x,wgn,mu,order);
[~,~,w_ben] = ma_lms_gass(x,wgn,mu,order,'Benveniste');
[~,~,w_ang] = ma_lms_gass(x,wgn,mu,order,'Ang_Farhang');
[~,~,w_matt] = ma_lms_gass(x,wgn,mu,order,'Matthews_Xie');

% Find weight error vectors
w_tilde_lms = b1 - w_lms;
w_tilde_ben = b1 - w_ben;
w_tilde_ang = b1 - w_ang;
w_tilde_matt = b1 - w_matt;

% Plot weight error curves for mu=0.01
figure(1)
hold on;
plot(w_tilde_lms,'c')
plot(w_tilde_ben,'b')
plot(w_tilde_ang,'k')
plot(w_tilde_matt,'r')
axis([0 200 -inf inf])
title('Weight Error Curves for \mu=0.01')
xlabel('Steps')
ylabel('Weight Error')

% Set mu to 0.1
mu = 0.1;
order = 1;
% Use regular LMS
[~,~,w_lms_2] = ma_lms(x,wgn,mu,order);
[~,~,w_ben_2] = ma_lms_gass(x,wgn,mu,order,'Benveniste');
[~,~,w_ang_2] = ma_lms_gass(x,wgn,mu,order,'Ang_Farhang');
[~,~,w_matt_2] = ma_lms_gass(x,wgn,mu,order,'Matthews_Xie');

% Find weight error vectors
w_tilde_lms_2 = b1 - w_lms_2;
w_tilde_ben_2 = b1 - w_ben_2;
w_tilde_ang_2 = b1 - w_ang_2;
w_tilde_matt_2 = b1 - w_matt_2;

% Plot weight error curves for mu=0.1
figure(2)
hold on;
plot(w_tilde_lms_2,'c')
plot(w_tilde_ben_2,'b')
plot(w_tilde_ang_2,'k')
plot(w_tilde_matt_2,'r')
axis([0 200 -inf inf])
title('Weight Error Curves for \mu=0.1')
xlabel('Steps')
ylabel('Weight Error')