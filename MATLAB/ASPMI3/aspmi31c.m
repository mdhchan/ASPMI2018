% ASPMI Exercise 3.1c
% For the example in Part a), estimate the corresponding misadjustment by
% time-averaging over the steady state of the ensemble-averaged learning 
% curves using 100 independent trials of the experiment. Compare the 
% estimated values with the theoretical LMS misadjustment in (24).

N=1000;
a1 = 0.1;
a2 = 0.8;

% Find mean squared error for 100 realisations
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

% Calculate absolute squared prediction error
se_1_100 = emat_1.^2;% For mu=0.05
se_2_100 = emat_2.^2;% For mu=0.01
% Get the mean across all realisations
se_1_avg = mean(se_1_100,2);
se_2_avg = mean(se_2_100,2);

% Time average over steady state
% Steady state is around 400 steps for both - cut off first 400 steps and
% average over time
MSE_ss_1 = mean(se_1_avg(401:end),1);
MSE_ss_2 = mean(se_2_avg(401:end),1);
% Find EMSE estimate of the steady state for both values of mu
EMSE_1_hat = MSE_ss_1-0.25;
EMSE_2_hat = MSE_ss_2-0.25;
MA_1_hat = EMSE_1_hat/0.25;
MA_2_hat = EMSE_2_hat/0.25;

% Display both Misadjustment estimates and theoretical Misadjustment
% Find trace of autocorrelation matrix
z = autocorr(x);
Rxx = toeplitz(z);
tr_x = trace(Rxx);
% Find theoretical misadjustment
MA_1 = 0.05*tr_x/2;
MA_2 = 0.01*tr_x/2;
disp(MA_1_hat);
disp(MA_1);
disp(MA_2_hat);
disp(MA_2);
