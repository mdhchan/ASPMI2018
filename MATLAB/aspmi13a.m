% ASPMI Part 1.3a
% Find empirically the -3dB width of the Bartlett Window for different
% values of N

% Find 8192 bin fft for all results
L = 8192;
fn = -0.5:1/L:0.5-1/L; % Normalised frequency to 2*pi

% Vector of N values
% N = [4,8,16,32,64,128,256,512,1024];
N = 4:4:256;
w_bart = zeros(L,length(N));
fft_w = zeros(L,length(N));
for i = 1:length(N)
    temp = bartlett(N(i));
    for j = 1:N(i)
        w_bart(j,i) = temp(j);
    end
    fft_w(:,i) = fft(w_bart(:,i),L); % Find FFT spectrum of Bartlett window
    fft_w(:,i) = fftshift(fft_w(:,i)); % Centre FFT spectrum
end

mag_w = abs(fft_w); % Magnitude spectrum
% Add tiny offset to allow for non-infinite logarithmic values
mag_w = mag_w + 10e-9;
log_mag_w = 20*log10(mag_w); % Find logarithmic magnitude spectrum

% Find 3dB width
% Find Half bandwidth
log_mag_w_half = log_mag_w(L/2+1:L,:);
fn_half = fn(L/2+1:L);
width_3dB = zeros(length(N),1);
for i = 1:length(N)
    temp = log_mag_w_half(:,i);
    idx_3dB = find(temp < temp(1)-3,1,'first');
    width_3dB(i) = 2*fn_half(idx_3dB); % Multiply half bandwidth by 2
end

% Plot relationship between -3dB width and N
figure(1)
subplot(2,1,1)
stem(N,width_3dB);
title('Empirical Graph Between -3dB Width and N')
xlabel('N');
ylabel('3dB width (\times 2\pi)/Hz')
subplot(2,1,2)
plot(1./N,width_3dB);
title('Graph of -3dB Width against 1/N');
xlabel('1/N');
ylabel('-3dB Width (\times 2\pi)/Hz');

% Plot and find relationship between -3dB width and 1/N
figure(2)
hold on;
scatter(1./N,width_3dB);
relation = 1.28*1./N;
plot(1./N,relation);
title('Empirical Graph Between -3dB Width and 1/N')
xlabel('1/N');
ylabel('3dB width (\times 2\pi)/Hz')

% Plot linear and logarithmic plots for N = 4
figure(3)
suptitle('Linear and Logarithmic Plots for N = 4');
subplot(2,1,1)
plot(fn,mag_w(:,1)); % Plot linear graph
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Linear Amplitude')
subplot(2,1,2)
plot(fn,log_mag_w(:,1));
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Logarithmic Amplitude/dB')

% Plot linear and logarithmic plots for N = 32
figure(4)
suptitle('Linear and Logarithmic Plots for N = 32');
subplot(2,1,1)
plot(fn,mag_w(:,8)); % Plot linear graph
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Linear Amplitude')
subplot(2,1,2)
plot(fn,log_mag_w(:,8));
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Logarithmic Amplitude/dB')

% Plot linear and logarithmic plots for N = 128
figure(5)
suptitle('Linear and Logarithmic Plots for N = 128');
subplot(2,1,1)
plot(fn,mag_w(:,32)); % Plot linear graph
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Linear Amplitude')
subplot(2,1,2)
plot(fn,log_mag_w(:,32));
xlabel('Normalised Frequency (\times 2\pi)/Hz')
ylabel('Logarithmic Amplitude/dB')

% Use to find values of Sidelobes
windowDesigner;