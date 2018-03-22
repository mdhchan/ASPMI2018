% Calculates ACLMS estimate for AR coefficients
% Returns xhat, error and weights given x,mu and order input
function [ y,e,hmat,gmat ] = ar_prediction_aclms(x,mu,order,delay)
    % Initialise weights with zero coefficients
    h = zeros(order,1);
    g = zeros(order,1);
    N = length(x); % Find the length of x
    y = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    hmat = h;
    gmat = g;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter for AR process
    % Find error and adapt weights
    x_vec = zeros(order,1); % Initialise vector of past x values
    for n = 1:N
        for m = 1:order
            if (n-(m+delay-1))<1
                x_vec(m) = 0;
            else
                x_vec(m) = x(n-(m+delay-1));
            end
        end
        y(n) = h'*x_vec + g'*conj(x_vec); % Use FIR filter
        e(n) = x(n) - y(n); % Find error
        h = h + mu*e(n)'*x_vec; % Adapt filter coefficients using error and mu
        g = g + mu*e(n)'*conj(x_vec);
        hmat = [hmat h];
        gmat = [gmat g];
    end
end

