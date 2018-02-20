% Calculates LMS estimate for MA coefficients
% Returns xhat, error and weights given x,eta,mu and order input
function [ xhat,e,bmat] = ma_lms_gass(x,eta,mu,order,algo)
    % Initialise weights with zero coefficients
    b = zeros(order,1);
    N = length(x); % Find the length of x
    xhat = zeros(N,1); % Initialise xhat vector
    e = zeros(N,1); % Initialise e vector
    bmat = b;
    
    % Calculate xhat for n=1 to N
    % Implement FIR filter/MA process
    % Find error and adapt weights
    eta_vec = zeros(order,1); % Initialise vector of past x values
    eta_vec_minus_one = zeros(order,1);
    psi = 0; % Set initial value of psi to 0
    for n =1:N
        for m = 1:order
            if (n-m)<1
                eta_vec(m) = 0;
            else
                eta_vec(m) = eta(n-m);
            end
        end
        xhat(n) = b.'*eta_vec+eta(n); % Use FIR filter;
        e(n) = x(n) - xhat(n); % Find error
        switch algo
            case 'Benveniste'
                if n==1
                    psi = 0;
                else
                    psi = (eye(length(eta_vec))-mu*...
                    (eta_vec_minus_one*eta_vec_minus_one.'))*...
                    psi+e(n-1)*eta_vec_minus_one;
                end
            case 'Ang_Farhang'
                if n==1
                    psi = 0;
                else
                    alpha = 0.1;
                    psi = alpha*psi+e(n-1)*eta_vec_minus_one;
                end
            case 'Matthews_Xie'
                if n==1
                     psi = 0;
                else
                    psi = e(n-1)*eta_vec_minus_one;
                end
        end
        rho = 0.1;
        mu = mu + rho*e(n)*eta_vec*psi; % Adapt mu according to psi
        b = b + mu*e(n)*eta_vec; % Adapt filter coefficients using error and mu
        bmat = [bmat b];
        eta_vec_minus_one = eta_vec;
    end
end

