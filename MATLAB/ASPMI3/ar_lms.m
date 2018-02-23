% Calculates LMS estimate for AR coefficients
% Returns xhat, error and weights given x,mu and order input
function [ xhat,e,amat] = ar_lms(x,mu,order)
    % Initialise weights with zero coefficients
    a = zeros(order,1);
    N = length(x); % Find the length of x
    xhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    amat = a;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter for AR process
    % Find error and adapt weights
    x_vec = zeros(order,1); % Initialise vector of past x values
    for n =1:N
        for m = 1:order
            if (n-m)<1
                x_vec(m) = 0;
            else
                x_vec(m) = x(n-m);
            end
        end
        xhat(n) = a.'*x_vec; % Use IIR filter;
        e(n) = x(n) - xhat(n); % Find error
        a = a + mu*e(n)*x_vec; % Adapt filter coefficients using error and mu
        amat = [amat a];
    end
end

