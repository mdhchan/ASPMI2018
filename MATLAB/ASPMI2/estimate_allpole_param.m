% Calculates sigma2 and a parameters given x and p
function [ sigma2,a_hat ] = estimate_allpole_param(x,p)
    % Find vector of autocorrelations
    Rvec = xcorr(x,'biased');
    % Take only lags >= 0
    midval = ceil(length(Rvec)/2);
    Rvec = Rvec(midval:end);
    % Find Matrix of correlations Rmat
    Rmat = zeros(p+1,p+1);
    for i = 1:p+1
        for j = 1:p+1
            % Find corresponding index
            Rmat(i,j) = Rvec(abs(j-i)+1);
        end
    end
    c = zeros(p+1,1);
    c(1) = 1;
    A = Rmat\c;
    sigma2 = 1/A(1);
    a_hat = A./A(1);
    a_hat = a_hat(2:end);
end

