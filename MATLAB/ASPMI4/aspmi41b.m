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


% % Work with medium wind regime
% load ../wind-dataset/medium-wind.mat;
% % Plot circularity diagram
% figure
% scatter(v_east,v_north);
% title('Circularity diagram of medium wind regime')
% xlabel('v_{east}')
% ylabel('v_{north}')
% 
% load ../wind-dataset/low-wind.mat;
% % Plot circularity diagram
% figure
% scatter(v_east,v_north);
% title('Circularity diagram of low wind regime')
% xlabel('v_{east}')
% ylabel('v_{north}')