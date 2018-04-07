% ASPMI Exercise 3.1b
% Implement an LMS adaptive predictor using N = 1000 samples of x(n) as in
% a) and plot the squared prediction error e2(n) dB i.e. 10 log(e2(n)) 
% along time using step sizes mu = 0:05 and mu = 0:01. Repeat this experiment
% for 100 different realizations of x(n) and plot the learning curve by
% averaging the plots of 10 log(e2(n)).

N=1000;
a1 = 0.1;
a2 = 0.8;

% Generate WGN with variance 0.25
wgn = 0.5*randn(N,1);
% Filter WGN with a coefficients
b = 1;
a = [1 -a1 -a2];
x = filter(b,a,wgn);

% Use LMS adaptive predictor to calculate AR coefficients for different mus
% Set mu to 0.05
mu = 0.05;
order = 2;
[ xhat_1,e_1,amat_1] = ar_lms(x,mu,order);

% Set mu to 0.01
mu = 0.01;
order = 2;
[ xhat_2,e_2,amat_2] = ar_lms(x,mu,order);

% Calculate squared prediction error in db
se_db_1 = 10*log10(e_1.^2);% For mu=0.05
se_db_2 = 10*log10(e_2.^2);% For mu=0.01

% Plot squared prediction error for one realisation for both values of mu
figure(1)
subplot(2,1,1)
plot(se_db_1,'b');
xlabel('Steps');
ylabel('Squared Error/dB');
title('Squared Error in dB for \mu=0.05 (1 Realisation)')
subplot(2,1,2)
plot(se_db_2,'b');
xlabel('Steps');
ylabel('Squared Error/dB');
title('Squared Error in dB for \mu=0.01 (1 Realisation)')

% Repeat for 100 realisations
R = 100;
% Create matrix of error vectors
emat_1 = zeros(N,R);
emat_2 = zeros(N,R);
for r = 1:R
    % Generate WGN with variance 0.25
    wgn = 0.5*randn(N,1);
    % Filter WGN with a coefficients
    b = 1;
    a = [1 -a1 -a2];
    x = filter(b,a,wgn);

    % Use LMS adaptive predictor to calculate AR coefficients for different mus
    % Set mu to 0.05
    mu = 0.05;
    order = 2;
    [ xhat_1,e_1,amat_1] = ar_lms(x,mu,order);

    % Set mu to 0.01
    mu = 0.01;
    order = 2;
    [ xhat_2,e_2,amat_2] = ar_lms(x,mu,order);
    
    % Add to matrix of error vectors
    emat_1(:,r) = e_1;
    emat_2(:,r) = e_2;
end

% Calculate squared prediction error in db
se_db_1_100 = 10*log10(emat_1.^2);% For mu=0.05
se_db_2_100 = 10*log10(emat_2.^2);% For mu=0.01
% Get the mean across all realisations
se_db_1_avg = mean(se_db_1_100,2);
se_db_2_avg = mean(se_db_2_100,2);

% Plot mean squared prediction error for one realisation for both values
% of mu
figure(2)
subplot(2,1,1)
plot(se_db_1_avg,'b');
xlabel('Steps');
ylabel('Squared Error/dB');
title('Squared Error in dB for \mu=0.05 (Mean of 100 Realisations)')
subplot(2,1,2)
plot(se_db_2_avg,'b');
xlabel('Steps');
ylabel('Squared Error/dB');
title('Squared Error in dB for \mu=0.01 (Mean of 100 Realisations)')