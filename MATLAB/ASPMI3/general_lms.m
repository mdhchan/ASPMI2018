% Calculates LMS estimate using general form
% Returns xhat, error and weights given d,eta,mu and order input
function [ xhat,e,bmat] = general_lms(d,x,mu,order)
    % Initialise weights with zero coefficients
    b = zeros(order,1);
    N = length(d); % Find the length of x
    xhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    bmat = b;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter/MA process
    % Find error and adapt weights
    eta_vec = zeros(order,1); % Initialise vector of past x values
    for n =1:N
        for m = 1:order
            if (n-m)<1
                eta_vec(m) = 0;
            else
                eta_vec(m) = x(n-m);
            end
        end
        xhat(n) = b.'*eta_vec+x(n); % Use FIR filter;
        e(n) = d(n) - xhat(n); % Find error
        b = b + mu*e(n)*eta_vec; % Adapt filter coefficients using error and mu
        bmat = [bmat b];
    end
end

