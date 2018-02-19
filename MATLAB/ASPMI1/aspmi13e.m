% ASPMI Part 1.3e
% Plot amplitude of the Fourier transform of the Bartlett window
phi1 = 0;
phi2 = 0;
N = 256;
win = bartlett(N);
% Find amplitude of the Fourier Transform
fft_win = fftshift(fft(win));
amp_win = abs(fft_win);
amp_win = amp_win+10e-13;
amp_win_dB = 20*log10(amp_win);% Convert to dB

% Plot amplitude of Fourier Transform
f = -0.5*N:0.5*N-1;
figure(1)
plot(f,amp_win_dB);
title('Amplitude of the Fourier Transform of the Bartlett Window in dB')
ylabel('Amplitude/dB')
xlabel('Normalised Frequency\timesN/Hz')
axis([0 20 -inf inf])