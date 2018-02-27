% Implements Adaptive Noise Cancellation using LMS algorithm
% Returns xhat, error and weights given x,mu, order and inputs
% Note that in this case error e = xhat
function [ eta_hat,xhat,amat] = anc_lms(s,mu,order,epsilon)
    % Initialise weights with zero coefficients
    a = zeros(order,1);
    N = length(s); % Find the length of x
    eta_hat = zeros(N,1); % Initialise xhat vector
    xhat = zeros(N,1); % Initialise e vector
    amat = a;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter for AR process
    % Find error and adapt weights
    epsilon_vec = zeros(order,1); % Initialise vector of past epsilon values
    for n =1:N
        for m = 1:order
            if (n-m)<1
                epsilon_vec(m) = 0;
            else
                epsilon_vec(m) = epsilon(n-m);
            end
        end
        eta_hat(n) = a.'*epsilon_vec; % Use FIR filter;
        xhat(n) = s(n) - eta_hat(n); % Find error
        a = a + mu*xhat(n)*epsilon_vec; % Adapt filter coefficients using error and mu
        amat = [amat a];
    end
end

