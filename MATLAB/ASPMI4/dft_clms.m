% Calculates CLMS estimate for DFT coefficients
% Returns yhat, error and weights given x,mu and order input
function [ yhat,e,wmat] = dft_clms(y,mu,N,lambda)
    % Initialise weights with zero coefficients
    w = zeros(N,1);
    M = length(y); % Find the length of y
    yhat = zeros(M,1); % Initialise yhat vector
    e = zeros(M,1); % Initialise e vector
    wmat = w;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter for AR process
    % Find error and adapt weights
    x = zeros(N,1); % Initialise vector of DFT coefficients
    for n =1:M
        for k = 1:N
            x(k) = exp(1i*2*(k-1)*n*pi/N);
        end
        yhat(n) = w'*x; % Use FIR filter;
        e(n) = y(n) - yhat(n); % Find error
        w = lambda*w + mu*e(n)'*x; % Adapt filter coefficients using error and mu
        wmat = [wmat w];
    end
end

