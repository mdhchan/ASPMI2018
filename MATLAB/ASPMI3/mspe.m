% Calculates the MSPE given x(n) and xhat(n)
function mspe_x = mspe( x,xhat )
    % Calculate squared error
    error_squared = (x - xhat).^2;
    % Find mean squared error
    mspe_x = mean(error_squared);
end