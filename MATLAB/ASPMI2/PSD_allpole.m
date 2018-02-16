% Calculate PSD for a particular angular frequency w given the pole (d)
% coefficients and the variance sigma2
% Note that pole coefficients are given such that the denominator is equal
% to d_0 + d_1*exp(-jw) + d_2*exp(-2jw) + ... + d_p*exp(-pjw), where p is
% the filter order
function P = PSD_allpole(sigma2,w,d)
    p = length(d)-1; % Find largest order of the filter
    % Find complex exponential vector
    cevector = zeros(p+1,1);
    for k=1:p+1
       cevector(k) = exp(-1i*(k-1)*w); 
    end
    denom = (abs(d*cevector)).^2;
    P = sigma2./denom;
end