% ASPMI Exercise 2.3d
% Using the same PCR and OLS regression coef?cients as in (c), compute and
% compare the mean square error estimates for the PCR and OLS schemes, MSE
% = E{||Y?Y_hat||^2_2}, based on the realisations of Y and Y_hat provided
% by the function regval. Comment on the effectiveness of these schemes.

% Load PCAPCR
load ../PCAPCR/PCAPCR.mat;

% Find OLS estimate of B
BOLS_hat = (Xnoise.'*Xnoise)\Xnoise.'*Y;
% Find PCR estimate of B
r = 3; % Rank
% Use SVD to obtain U,S,V of Xnoise such that U*S*V'
[U_noise,S_noise,V_noise] = svd(Xnoise);
% Approximate S_X
U_noise_tilde = U_noise(:,1:r); % Take r columns
S_noise_tilde = S_noise(1:r,1:r); % Take rxr matrix
V_noise_tilde = V_noise(:,1:3); % Take r columns
BPCR_hat = (V_noise_tilde/S_noise_tilde)*U_noise_tilde.'*Y;

% Find MSE of OLS
[Y_hat_OLS,Y_OLS] = regval(BOLS_hat);
err_OLS = immse(Y_hat_OLS,Y_OLS);

% Find MSE of PCR
[Y_hat_PCR,Y_PCR] = regval(BPCR_hat);
err_PCR = immse(Y_hat_PCR,Y_PCR);
