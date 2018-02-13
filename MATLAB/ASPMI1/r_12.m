function [ r ] = r_12(k, M)
    % Calculate ACF for r(k) as described in Section 1.2
    if abs(k) <= (M-1)
        r = (M - abs(k))/M;
    else
        r = 0;
    end
end
