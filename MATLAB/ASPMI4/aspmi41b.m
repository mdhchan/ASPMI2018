% ASPMI Exercise 4.1b
% Load the bivariate wind data of the wind speeds in the East-West
% direction, veast, and North-South direction, vnorth. Form a 
% complex-valued wind signal for the three wind regimes
% (low, medium, high). Use the scatter(x,y) function to plot a scatter 
% diagram (the scatter diagram of the real and imaginary parts of a signal 
% is also referred to as a circularity plot) for these three regimes. 
% Configure the CLMS and ACLMS filters in a prediction setting 
% (see Equation (20)) to perform a one-step ahead prediction of the 
% complex wind data. Experiment with different filter lengths and comment 
% on which algorithm (CLMS or ACLMS) performs better for the different 
% wind regimes.

% Work with high wind regime
load ../wind-dataset/high-wind.mat;
% Plot circularity diagram
figure(1)
scatter(v_east,v_north);
title('Circularity diagram of high wind regime')
xlabel('v_{east}')
ylabel('v_{north}')
% Use 1 step ahead prediction
mu = 0.001;
order = 100;
delay = 1;
v = v_east+1i*v_north;
[ v_clms_high,e_clms_high,~] = ar_prediction_clms(v,mu,order,delay);
[ v_aclms_high,e_aclms_high,~,~] = ar_prediction_aclms(v,mu,order,delay);

e_clms_high_db = 10*log10(abs(e_clms_high).^2);
e_aclms_high_db = 10*log10(abs(e_aclms_high).^2);

figure(2)
title('Error Plot for high wind regime CLMS');
plot(e_clms_high_db);
figure(3)
title('Error Plot for high wind regime ACLMS');
plot(e_aclms_high_db);

% display(mean(e_clms_high_db));
% display(mean(e_aclms_high_db));

% Work with medium wind regime
load ../wind-dataset/medium-wind.mat;
% Plot circularity diagram
figure(4)
scatter(v_east,v_north);
title('Circularity diagram of medium wind regime')
xlabel('v_{east}')
ylabel('v_{north}')
% Use 1 step ahead prediction
v = v_east+1i*v_north;
[ v_clms_medium,e_clms_medium,~] = ar_prediction_clms(v,mu,order,delay);
[ v_aclms_medium,e_aclms_medium,~,~] = ar_prediction_aclms(v,mu,order,delay);

e_clms_medium_db = 10*log10(abs(e_clms_medium).^2);
e_aclms_medium_db = 10*log10(abs(e_aclms_medium).^2);

figure(5)
title('Error Plot for medium wind regime CLMS');
plot(e_clms_medium_db);
figure(6)
title('Error Plot for high wind regime ACLMS');
plot(e_aclms_medium_db);

load ../wind-dataset/low-wind.mat;
% Plot circularity diagram
figure(7)
scatter(v_east,v_north);
title('Circularity diagram of low wind regime')
xlabel('v_{east}')
ylabel('v_{north}')
% Use 1 step ahead prediction
v = v_east+1i*v_north;
[ v_clms_low,e_clms_low,~] = ar_prediction_clms(v,mu,order,delay);
[ v_aclms_low,e_aclms_low,~,~] = ar_prediction_aclms(v,mu,order,delay);

e_clms_low_db = 10*log10(abs(e_clms_low).^2);
e_aclms_low_db = 10*log10(abs(e_aclms_low).^2);

figure(8)
title('Error Plot for high wind regime CLMS');
plot(e_clms_low_db);
figure(9)
title('Error Plot for high wind regime ACLMS');
plot(e_aclms_low_db);

figure(10)
subplot(2,1,1)
title('East wind prediction')
hold on;
plot(v_east,'r');
plot(real(v_clms_low),'b');
plot(real(v_aclms_low),'c');
subplot(2,1,2)
title('East wind prediction')
hold on;
plot(v_north,'r');
plot(imag(v_clms_low),'b');
plot(imag(v_aclms_low),'c');