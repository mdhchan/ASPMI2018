% ASPMI Exercise 3.1a
% What are the entries of the correlation matrix of the input vector x(n)
% Furthermore, for what range of values of the step size µ will the 
% LMS converge in the mean?

% Simulation parameters
a_1 = 0.1;
a_2 = 0.8;
sigma2 = 0.25;

% Find r_0 and r_1
r_0 = sigma2;
r_1 = sigma2*a_1/(1-a_2);
% Find R
R = [r_0 r_1; r_1 r_0];
% Decompose R into eigenvalues
lambda_vec = eig(R);
% Find maximum eigenvalue
lambda_max = max(lambda_vec);
% Find maximum step size
mu_max = 2/lambda_max;