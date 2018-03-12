% ASPMI Exercise 4.1a
% Generate a first-order widely-linear-moving-average process, WLMA(1),
% driven by circular white Gaussian noise x(n)
%     y(n) = x(n) + b1x(n - 1) + b2x*(n - 1) x ~ N (0, 1)
% where b1 = 1.5 + 1j and b2 = 2.5 ? 0.5j. Write a MATLAB function for the
% ACLMS and implement both the CLMS and ACLMS in the system identification
% setting to identify the WLMA model in (41). Plot the learning curve, 
% 10log|e(n)|^2, for the ACLMS and CLMS.

N = 10000;
% Generate circular white Gaussian noise x ~ N(0,1)
x = 1/sqrt(2)*(randn(N,1)+1i*randn(N,1));

% Generate WLMA(1) process
% Lag by 1
x_m1 = zeros(N,1);
x_m1(2:end) = x(1:end-1);
% Lag by 2
x_m2 = zeros(N,1);
x_m2(3:end) = x(1:end-2);
% Add weighted sum
b1 = 1.5 + 1i;
b2 = 2.5 - 0.5*1i;
y = x + b1*x_m1 + b2*conj(x_m2);
% y = x + b1*x_m1;

% Implement CLMS and ACLMS algorithms
mu = 0.001;
order = 1;
[ yhat_clms,e_clms,bmat] = ma_clms(x,mu,order,y);
order = 1;
[ yhat_aclms,e_aclms,hmat,gmat] = ma_aclms(x,mu,order,y);

% Plot error
e_clms_db = 10*log10(abs(e_clms).^2);
e_aclms_db = 10*log10(abs(e_aclms).^2);
figure(1)
hold on;
plot(e_clms_db);
plot(e_aclms_db);