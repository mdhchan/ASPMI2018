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
% Add weighted sum
b1 = 1.5 + 1i;
b2 = 2.5 - 0.5*1i;
y = x + b1*x_m1 + b2*conj(x_m1);

% Implement CLMS and ACLMS algorithms
mu = 0.01;
% Plot 100 realisations and average
M = 100;
e_clms_mat = zeros(N,M);
e_aclms_mat = zeros(N,M);
for i=1:M
    order = 1;
    [ yhat_clms,e_clms_re,bmat] = ma_clms(x,mu,order,y);
    order = 1;
    [ yhat_aclms,e_aclms_re,hmat,gmat] = ma_aclms(x,mu,order,y);
    e_clms_mat(:,i) = e_clms_re;
    e_aclms_mat(:,i) = e_aclms_re;
end
e_clms = mean(e_clms_mat,2);
e_aclms = mean(e_aclms_mat,2);

% Plot error
e_clms_db = 10*log10(abs(e_clms).^2);
e_aclms_db = 10*log10(abs(e_aclms).^2);
figure(1)
hold on;
plot(e_clms_db,'b');
plot(e_aclms_db,'r');
title('ACLMS and CLMS Learning Curve Averaged Across 100 Realisations')
xlabel('Time Sample')
ylabel('Error/dB')
legend('CLMS Learning Curve','ACLMS Learning Curve')

% Plot coefficients
figure(2)
subplot(2,1,1)
plot(real(hmat));
subplot(2,1,2)
plot(imag(hmat));
figure(3)
subplot(2,1,1)
plot(real(gmat));
subplot(2,1,2)
plot(imag(gmat));