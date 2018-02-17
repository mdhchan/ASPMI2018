% ASPMI Exercise 3.1d
% Estimate the steady state values of the adaptive filter coefficients for
% the step-sizes of 0.05 and 0.01. Note that you may do this by averaging
% the steady-state values of the coefficients (obtained along the the final
% iterations of the LMS) over 100 independent trials of the experiment. 
% Compare these estimated values with the true coefficients, and explain 
% your findings.

N=1000;
a1 = 0.1;
a2 = 0.8;

% Use LMS Algorithms for 100 realisations
R = 100;
% Create matrix of AR coefficient vectors
a1_mat_1 = zeros(N+1,R); % a1 for mu=0.05
a2_mat_1 = zeros(N+1,R); % a1 for mu=0.01
a1_mat_2 = zeros(N+1,R); % a2 for mu=0.05
a2_mat_2 = zeros(N+1,R); % a1 for mu=0.01
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
    
    % Add to matrix of AR coefficient vectors
    a1_mat_1(:,r) = amat_1(1,:);
    a2_mat_1(:,r) = amat_1(2,:);
    a1_mat_2(:,r) = amat_2(1,:);
    a2_mat_2(:,r) = amat_2(2,:);
end

% Find Ensemble average
a1_1_avg = mean(a1_mat_1,2);
a2_1_avg = mean(a2_mat_1,2);
a1_2_avg = mean(a1_mat_2,2);
a2_2_avg = mean(a2_mat_2,2);
% Time average over steady state
% Steady state is around 400 steps for both - cut off first 400 steps and
% average over time
% Find steady state averages for mu = 0.05
a1_1_ss = mean(a1_1_avg(401:end),1);
a2_1_ss = mean(a2_1_avg(401:end),1);
a1_2_ss = mean(a1_2_avg(401:end),1);
a2_2_ss = mean(a2_2_avg(401:end),1);

% Display steady state averages
disp(a1_1_ss);
disp(a2_1_ss);
disp(a1_2_ss);
disp(a2_2_ss);