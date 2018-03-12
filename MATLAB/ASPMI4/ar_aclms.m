% Calculates ACLMS estimate for AR coefficients
% Returns xhat, error and weights given x,mu and order input
function [ xhat,e,amat] = ma_aclms(x,mu,order)
    % Initialise weights with zero coefficients
    h = zeros(order,1);
    N = length(x); % Find the length of x
    xhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    amat = h;
    
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
        xhat(n) = h'*x_vec; % Use FIR filter;
        e(n) = x(n) - xhat(n); % Find error
        h = h + mu*e(n)'*x_vec; % Adapt filter coefficients using error and mu
        amat = [amat h];
    end
end

