% ASPMI Exercise 3.1f
% Implement the leaky LMS algorithm (with different values for gamma and mu
% to estimate the AR coefficients of the signal given in Part a).

N=1000;
a1 = 0.1;
a2 = 0.8;

% Use LMS Algorithms for 100 realisations
R = 100;
% Create matrix of AR coefficient vectors
a1_mat_1 = zeros(N+1,R); % a1 for mu=0.05, gamma=0.1
a2_mat_1 = zeros(N+1,R); % a2 for mu=0.05, gamma=0.1
a1_mat_2 = zeros(N+1,R); % a1 for mu=0.01, gamma=0.1
a2_mat_2 = zeros(N+1,R); % a2 for mu=0.01, gamma=0.1
a1_mat_3 = zeros(N+1,R); % a1 for mu=0.05, gamma=0.01
a2_mat_3 = zeros(N+1,R); % a2 for mu=0.05, gamma=0.01
a1_mat_4 = zeros(N+1,R); % a1 for mu=0.01, gamma=0.01
a2_mat_4 = zeros(N+1,R); % a2 for mu=0.01, gamma=0.01
for r = 1:R
    % Generate WGN with variance 0.25
    wgn = 0.5*randn(N,1);
    % Filter WGN with a coefficients
    b = 1;
    a = [1 -a1 -a2];
    x = filter(b,a,wgn);

    % Use LMS adaptive predictor to calculate AR coefficients for different mus
    % Set mu to 0.05, gamma=0.1
    mu = 0.05;
    gamma = 0.1;
    order = 2;
    [ xhat_1,e_1,amat_1] = ar_lms_leaky(x,mu,gamma,order);

    % Set mu to 0.01, gamma=0.1
    mu = 0.01;
    gamma = 0.1;
    order = 2;
    [ xhat_2,e_2,amat_2] = ar_lms_leaky(x,mu,gamma,order);
    
    % Set mu to 0.05, gamma=0.01
    mu = 0.05;
    gamma = 0.01;
    order = 2;
    [ xhat_3,e_3,amat_3] = ar_lms_leaky(x,mu,gamma,order);
    
    % Set mu to 0.01, gamma=0.01
    mu = 0.01;
    gamma = 0.01;
    order = 2;
    [ xhat_4,e_4,amat_4] = ar_lms_leaky(x,mu,gamma,order);
    
    % Add to matrix of AR coefficient vectors
    a1_mat_1(:,r) = amat_1(1,:);
    a2_mat_1(:,r) = amat_1(2,:);
    a1_mat_2(:,r) = amat_2(1,:);
    a2_mat_2(:,r) = amat_2(2,:);
    a1_mat_3(:,r) = amat_3(1,:);
    a2_mat_3(:,r) = amat_3(2,:);
    a1_mat_4(:,r) = amat_4(1,:);
    a2_mat_4(:,r) = amat_4(2,:);
end

% Find Ensemble average
a1_1_avg = mean(a1_mat_1,2);
a2_1_avg = mean(a2_mat_1,2);
a1_2_avg = mean(a1_mat_2,2);
a2_2_avg = mean(a2_mat_2,2);
a1_3_avg = mean(a1_mat_3,2);
a2_3_avg = mean(a2_mat_3,2);
a1_4_avg = mean(a1_mat_4,2);
a2_4_avg = mean(a2_mat_4,2);

% Plot mean values for different values of mu and gamma
figure(1)
hold on;
plot(a1_1_avg)
plot(a2_1_avg)
plot(a1_2_avg)
plot(a2_2_avg)
plot(a1_3_avg)
plot(a2_3_avg)
plot(a1_4_avg)
plot(a2_4_avg)
xlabel('Steps')
ylabel('Coefficient Values')
title('Coefficient Evolution for Varying \mu and \gamma')
legend('a_1 \mu=0.05 \gamma=0.05','a_2 \mu=0.05 \gamma=0.05', ...
    'a_1 \mu=0.01 \gamma=0.05','a_2 \mu=0.01 \gamma=0.05',...
    'a_1 \mu=0.05 \gamma=0.01','a_2 \mu=0.05 \gamma=0.01',...
    'a_1 \mu=0.01 \gamma=0.01','a_2 \mu=0.01 \gamma=0.01')

% Time average over steady state
% Steady state is around 400 steps for both - cut off first 400 steps and
% average over time
% Find steady state averages for the mu=0.05, gamma=0.1
a1_1_ss = mean(a1_1_avg(401:end),1);
a2_1_ss = mean(a2_1_avg(401:end),1);
% Find steady state averages for the mu=0.01, gamma=0.1
a1_2_ss = mean(a1_2_avg(401:end),1);
a2_2_ss = mean(a2_2_avg(401:end),1);
% Find steady state averages for the mu=0.05, gamma=0.01
a1_3_ss = mean(a1_3_avg(401:end),1);
a2_3_ss = mean(a2_3_avg(401:end),1);
% Find steady state averages for the mu=0.01, gamma=0.01
a1_4_ss = mean(a1_4_avg(401:end),1);
a2_4_ss = mean(a2_4_avg(401:end),1);

% Display steady state averages
disp(a1_1_ss);
disp(a2_1_ss);
disp(a1_2_ss);
disp(a2_2_ss);
disp(a1_3_ss);
disp(a2_3_ss);
disp(a1_4_ss);
disp(a2_4_ss);