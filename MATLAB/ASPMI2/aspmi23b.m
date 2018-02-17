% ASPMI Exercise 2.3b
% Using only the r most signi?cant principal components (as determined by 
% the identi?ed rank), create a low-rank approximation of Xnoise, denoted 
% by Xnoise_tilde. Compare the difference (error) between the variables 
% (columns) of the noiseless input matrix, X, and those in the noise 
% corrupted matrix Xnoise and denoised matrix Xnoise_tilde.

% Load PCAPCR
load ../PCAPCR/PCAPCR.mat;

r = 3; % Rank
% Use SVD to obtain U,S,V of Xnoise such that U*S*V'
[U_noise,S_noise,V_noise] = svd(Xnoise);
% Approximate S_X
U_noise_tilde = U_noise(:,1:r); % Take r columns
S_noise_tilde = S_noise(1:r,1:r); % Take rxr matrix
V_noise_tilde = V_noise(:,1:3); % Take r columns
Xnoise_tilde = U_noise_tilde*S_noise_tilde*V_noise_tilde.';

% Find squared error between X and Xnoise and Xnoise_tilde
Xnoise_se = sum((X-Xnoise).^2,1);
Xnoise_tilde_se = sum((X-Xnoise_tilde).^2,1);

figure(1)
% Plot squared error of X and Xnoise
subplot(2,1,1)
stem(Xnoise_se);
title('Squared Error of X and Xnoise')
ylabel('Squared Error')
xlabel('Column')
% Plot squared error of X and Xnoise_tilde
subplot(2,1,2)
stem(Xnoise_tilde_se);
title('Squared Error of X and Xnoise PCR Estimate')
ylabel('Squared Error')
xlabel('Column')
