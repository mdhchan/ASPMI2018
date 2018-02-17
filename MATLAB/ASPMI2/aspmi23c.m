% ASPMI Exercise 2.3c
% Calculate the OLS and PCR solutions for the parameter matrix B, which 
% relates Xnoise and Y. Next, compare the estimation error between Y and 
% YOLS_hat = Xnoise*BOLS_hat and YPCR_hat = Xnoise_tilde*BPCR_hat. Explain
% what happens when you estimate the data from the test-set using the 
% regression coef?cients computed from the training set, and quantify the
% performance by comparing Ytest and Ytest-OLS_hat = Xtest*BOLS_hat with 
% Ytest-PCR_hat = Xtest_tilde*BPCR_hat.

% Load PCAPCR
load ../PCAPCR/PCAPCR.mat;

% Find OLS estimate of B
BOLS_hat = (Xnoise.'*Xnoise)\Xnoise.'*Y;
YOLS_hat = Xnoise*BOLS_hat;
YOLS_hat_se = sum((YOLS_hat-Y).^2,1); % Find Squared Error

% Find PCR estimate of B
r = 3; % Rank
% Use SVD to obtain U,S,V of Xnoise such that U*S*V'
[U_noise,S_noise,V_noise] = svd(Xnoise);
% Approximate S_X
U_noise_tilde = U_noise(:,1:r); % Take r columns
S_noise_tilde = S_noise(1:r,1:r); % Take rxr matrix
V_noise_tilde = V_noise(:,1:3); % Take r columns
Xnoise_tilde = U_noise_tilde*S_noise_tilde*V_noise_tilde.';
BPCR_hat = (V_noise_tilde/S_noise_tilde)*U_noise_tilde.'*Y;
YPCR_hat = Xnoise_tilde*BPCR_hat;
YPCR_hat_se = sum((YPCR_hat-Y).^2,1); % Find Squared Error

figure(1)
% Plot squared error of Y and OLS estimate
subplot(2,1,1)
stem(YOLS_hat_se);
title('Squared Error of Y and OLS Estimate')
ylabel('Squared Error')
xlabel('Column')
% Plot squared error of Y and PCR estimate
subplot(2,1,2)
stem(YPCR_hat_se);
title('Squared Error of Y and PCR Estimate')
ylabel('Squared Error')
xlabel('Column')

% Compare test performances
% Find OLS estimate of Ytest
Ytest_OLS_hat = Xtest*BOLS_hat;

% Find PCR estimate of Ytest
r = 3; % Rank
% Use SVD to obtain U,S,V of Xnoise such that U*S*V'
[U_noise,S_noise,V_noise] = svd(Xtest);
U_noise_tilde = U_noise(:,1:r); % Take r columns
S_noise_tilde = S_noise(1:r,1:r); % Take rxr matrix
V_noise_tilde = V_noise(:,1:r); % Take r columns
Xtest_tilde = U_noise_tilde*S_noise_tilde*V_noise_tilde.';
Ytest_PCR_hat = Xtest_tilde*BPCR_hat;

% Find Squared Error
Ytest_OLS_hat_se = sum((Ytest_OLS_hat-Ytest).^2,1);
Ytest_PCR_hat_se = sum((Ytest_PCR_hat-Ytest).^2,1);

figure(2)
% Plot squared error of Ytest and OLS estimate
subplot(2,1,1)
stem(Ytest_OLS_hat_se);
title('Squared Error of Ytest and OLS Estimate')
ylabel('Squared Error')
xlabel('Column')
% Plot squared error of Ytest and PCR estimate
subplot(2,1,2)
stem(Ytest_PCR_hat_se);
title('Squared Error of Ytest and PCR Estimate')
ylabel('Squared Error')
xlabel('Column')