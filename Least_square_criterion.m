clc
clear all
close all
%% y (t) = a1 sin(2?f0t) + a2 sin(2?f1t) + n(t), t= 1,....,N
a1 = 1; 
a2 = 1;
f0 = 0.25;
f1 = 0.4;
standard_deviation = 1;
m = 5; %%choose m = 5
N = 10000;
t = 1:1:N;
n = standard_deviation .* randn(1,N);  
y = (a1.*sin(2*pi*f0.*t)) + (a2.*sin(2*pi*f1.*t)) + n;
y = y';
J = (y - (a1.*sin(2*pi*f0.*t')) - (a2.*sin(2*pi*f1.*t')));
J = J.^2;
J1 = sum(J);
disp(J1);