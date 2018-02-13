% Find the parameters of the Bartlett window - 3dB mainlobe width and sidelobe
% power
function [width_3dB, sidelobe_pow] = findbartlettwindowparams(N)
    % Find half-sided frequency response of windows of various sizes
    H = zeros(512,length(N)); % Find magnitude of windows
    W = zeros(512,length(N)); % Find phase of window
    for i = 1:length(N)
        temp_window = bartlett(N(i));
        [H(:,i),W(:,i)] = freqz(temp_window,1);
    end
    Hdb = 20*log10(abs(H)); % Find logarithmic response
    width_3dB = zeros(length(N),1);
    for i = 1:length(N)
        idx = find(Hdb(:,i) < Hdb(1)-3,1,'first');
        width_3dB(i) = (2*H(idx))/pi;
    end
end

