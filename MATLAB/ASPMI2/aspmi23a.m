% ASPMI Exercise 2.3a
% Plot the singular values of X and Xnoise in PCAPCR using stem,
% and identify the rank of the input data X. Plot the square error 
% between each singular value of X and Xnoise. Explain the effect of noise 
% on the singular values, and state at what point would it become hard to
% identify the rank of the matrix Xnoise.

% Load PCAPCR
load ../PCAPCR/PCAPCR.mat;

% Use SVD to obtain singular values of X and Xnoise
s_X = svd(X); % Obtain singular values of X
s_Xnoise = svd(Xnoise); % Obtain singular values of Xnoise

% Plot singular values of X and Xnoise
figure(1)
subplot(2,1,1)
stem(s_X);
title('Singular Values of X in Descending Value')
ylabel('Singular Values')
xlabel('Index')
subplot(2,1,2)
stem(s_Xnoise);
title('Singular Values of X in Descending Value')
ylabel('Singular Values')
xlabel('Index')

% Plot squared error between each singular value of X and Xnoise
X_se = (s_X-s_Xnoise).^2;
figure(2)
stem(X_se);
title('Squared Error Between Singular Values of X and Xnoise')
ylabel('Squared Error')
xlabel('Index')
