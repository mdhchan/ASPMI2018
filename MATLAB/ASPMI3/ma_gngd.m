% Calculates LMS estimate for MA coefficients using GNGD algorithm
% Returns xhat, error and weights given x,eta,mu and order input
function [ xhat,e,bmat] = ma_gngd(d,x,mu,order)
    % Initialise weights with zero coefficients
    b = zeros(order,1);
    N = length(d); % Find the length of x
    xhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    bmat = b;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter/MA process
    % Find error and adapt weights
    x_vec = zeros(order,1); % Initialise vector of past x values
    epsilon = 10e-14; % Initialise epsilon
    rho = 0.1; % Initialise rho
    for n =1:N
        for m = 1:order
            if (n-m)<1
                x_vec(m) = 0;
            else
                x_vec(m) = x(n-m);
            end
        end
        xhat(n) = b.'*x_vec+x(n); % Use FIR filter;
        e(n) = d(n) - xhat(n); % Find error
        % Find epsilon
        if n == 1
            epsilon = 10e-14;
        else
            epsilon = epsilon - ...
                rho*mu*e(n)*e(n-1)*x_vec.'*x_vec_minus_one/...
                (norm(x_vec_minus_one)^2+epsilon)^2;
        end
        % Find eta
        eta = mu/(norm(x_vec)^2+epsilon);
        b = b + eta*e(n)*x_vec; % Adapt filter coefficients using error and mu
        x_vec_minus_one = x_vec;
        bmat = [bmat b];
    end
end

