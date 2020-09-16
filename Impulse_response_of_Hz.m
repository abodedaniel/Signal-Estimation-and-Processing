%% plotting the frequency and impulse response of H(z)
close all
clc
freqz(rt)
title('Frequency response of H(z)');
figure
impz(rt)