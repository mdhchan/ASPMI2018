% ASPMI Exercise 2.4a
% Apply the standard periodogram as well as the averaged periodogram with 
% different window lengths (e.g. 50s, 150s) to obtain the power spectral
% density of the RRI data. Plot the PSDs of the RRI data obtained from 
% the three trials separately. 

% Load ECG data
load ../ECG_Data/RAW_2.mat;
data = data(:,2);
% Segment into three data segments of 240s each
ECG_Sep = zeros(3,240000);
ECG_Sep(1,:) = data(9001:249000);
ECG_Sep(2,:) = data(258001:498000);
ECG_Sep(3,:) = data(501001:741000);
% Convert all trials to RRI data
[RRI_trial_1, fs_RRI] = ECG_to_RRI(ECG_Sep(1,:),fs); % RRI for segment 1
[RRI_trial_2, fs_RRI] = ECG_to_RRI(ECG_Sep(2,:),fs); % RRI for segment 2
[RRI_trial_3, fs_RRI] = ECG_to_RRI(ECG_Sep(3,:),fs); % RRI for segment 3

% Close all figures
close all;

% Load ECG data
% load ECG_old.mat;

% Find standard periodogram
L = length(RRI_trial_1);
N = 2048; % Number of bins
win = hamming(L);
% Remove means
RRI_trial_1_centred = detrend(RRI_trial_1,'constant'); % Trial 1
RRI_trial_2_centred = detrend(RRI_trial_2,'constant'); % Trial 2
RRI_trial_3_centred = detrend(RRI_trial_3,'constant'); % Trial 3
f = 0:fs_RRI/N:fs_RRI*(N-1)/N;

[P_RRI_1,f_1_50] = periodogram(RRI_trial_1_centred,win,N,fs_RRI);
[P_RRI_2,f_2_50] = periodogram(RRI_trial_2_centred,win,N,fs_RRI);
[P_RRI_3,f_3_50] = periodogram(RRI_trial_3_centred,win,N,fs_RRI);

% Plot periodogram
figure(1)
subplot(3,1,1), plot(f_1_50,P_RRI_1);
title('\fontsize{16}Periodogram of Trial 1');
subplot(3,1,2), plot(f_2_50,P_RRI_2);
title('\fontsize{16}Periodogram of Trial 2');
subplot(3,1,3), plot(f_3_50,P_RRI_3);
title('\fontsize{16}Periodogram of Trial 3');

% Find averaged periodogram of time window of 50s with 50% overlap
win_50 = hamming(fs_RRI*50);
[P_RRI_1,f_1_50_avg] = pwelch(RRI_trial_1_centred,win_50,[],N,fs_RRI);
[P_RRI_2,f_2_50_avg] = pwelch(RRI_trial_2_centred,win_50,[],N,fs_RRI);
[P_RRI_3,f_3_50_avg] = pwelch(RRI_trial_3_centred,win_50,[],N,fs_RRI);

% Plot the averaged periodograms
figure(2)
subplot(3,1,1),plot(f_1_50_avg,P_RRI_1);
title('\fontsize{16}50s Averaged Periodogram of Trial 1');
subplot(3,1,2),plot(f_2_50_avg,P_RRI_2);
title('\fontsize{16}50s Averaged Periodogram of Trial 2');
subplot(3,1,3),plot(f_3_50_avg,P_RRI_3);
title('\fontsize{16}50s Averaged Periodogram of Trial 3');

% Find averaged periodogram of time window of 150s with 50% overlap
win_150 = hamming(fs_RRI*150);
[P_RRI_1,f_1_150_avg] = pwelch(RRI_trial_1_centred,win_150,[],N,fs_RRI);
[P_RRI_2,f_2_150_avg] = pwelch(RRI_trial_2_centred,win_150,[],N,fs_RRI);
[P_RRI_3,f_3_150_avg] = pwelch(RRI_trial_3_centred,win_150,[],N,fs_RRI);

% Plot the averaged periodograms
figure(3)
subplot(3,1,1),plot(f_1_150_avg,P_RRI_1);
title('\fontsize{16}150s Averaged Periodogram of Trial 1');
subplot(3,1,2),plot(f_2_150_avg,P_RRI_2);
title('\fontsize{16}150s Averaged Periodogram of Trial 2');
subplot(3,1,3),plot(f_3_150_avg,P_RRI_3);
title('\fontsize{16}150s Averaged Periodogram of Trial 3');
