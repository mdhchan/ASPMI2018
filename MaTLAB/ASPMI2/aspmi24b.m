% ASPMI Exercise 2.4b
% Plot the AR spectrum estimate for the RRI signals for the three trials.

% % Load ECG data
% load ../ECG_Data/RAW_2.mat;
% data = data(:,2);
% % Segment into three data segments of 240s each
% ECG_Sep = zeros(3,240000);
% ECG_Sep(1,:) = data(9001:249000);
% ECG_Sep(2,:) = data(258001:498000);
% ECG_Sep(3,:) = data(501001:741000);
% % Convert all trials to RRI data
% [RRI_trial_1, fs_RRI] = ECG_to_RRI(ECG_Sep(1,:),fs); % RRI for segment 1
% [RRI_trial_2, fs_RRI] = ECG_to_RRI(ECG_Sep(2,:),fs); % RRI for segment 2
% [RRI_trial_3, fs_RRI] = ECG_to_RRI(ECG_Sep(3,:),fs); % RRI for segment 3

% Load ECG data
load ../ECG_Data/ECG_extracted.mat;

N = 1024;
fn = 0:2/N:1-2/N;
w = 2*pi*fn;

% Remove means
RRI_trial_1_centred = detrend(RRI_trial_1,'constant'); % Trial 1
RRI_trial_2_centred = detrend(RRI_trial_2,'constant'); % Trial 2
RRI_trial_3_centred = detrend(RRI_trial_3,'constant'); % Trial 3

% Find estimated PSD for all three trials for p=25
p = 25;
% Trial 1
[sigma2,a_hat] = estimate_allpole_param(RRI_trial_1_centred,p);
P_1 = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P_1(i) = PSD_allpole(sigma2,w(i),d_hat);
end
% Trial 2
[sigma2,a_hat] = estimate_allpole_param(RRI_trial_2_centred,p);
P_2 = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P_2(i) = PSD_allpole(sigma2,w(i),d_hat);
end
% Trial 3
[sigma2,a_hat] = estimate_allpole_param(RRI_trial_3_centred,p);
P_3 = zeros(N/2,1);
d_hat = [1 a_hat.'];
for i = 1:N/2
    P_3(i) = PSD_allpole(sigma2,w(i),d_hat);
end

% Plot AR estimated spectra
figure(1)
hold on;
f = fs_RRI.*fn;
subplot(3,1,1)
plot(f,10*log10(P_1));
xlabel('Frequency/Hz');
ylabel('Power/dB');
title(['Estimated PSD for Trial 1 for ', ...
        'p = ', num2str(p)])
axis([0 2 -60 0])
subplot(3,1,2)
plot(f,10*log10(P_2));
xlabel('Frequency/Hz');
ylabel('Power/dB');
title(['Estimated PSD for Trial 2 for ', ...
        'p = ', num2str(p)])
axis([0 2 -60 0])
subplot(3,1,3)
plot(f,10*log10(P_3));
xlabel('Frequency/Hz');
ylabel('Power/dB');
title(['Estimated PSD for Trial 3 for ', ...
        'p = ', num2str(p)])
axis([0 2 -60 0])