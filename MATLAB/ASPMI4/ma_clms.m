% Calculates CLMS estimate for MA coefficients
% Returns yhat, error and weights given x,mu and order input
function [ yhat,e,bmat] = ma_clms(x,mu,order,y)
    % Initialise weights with zero coefficients
    h = zeros(order,1);
    N = length(x); % Find the length of x
    yhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    bmat = h;
    
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
        yhat(n) = h'*x_vec + x(n); % Use FIR filter;
        e(n) = y(n) - yhat(n); % Find error
        h = h + mu*e(n)'*x_vec; % Adapt filter coefficients using error and mu
        bmat = [bmat h];
    end
end

