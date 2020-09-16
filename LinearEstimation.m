clc
clear all
close all
%% y(t) = m + n(t) t= 1,....,N
v1 = zeros(5,5);
for j = 0:4
for i = 1:5
m = 5; %%choose m = 5
N = 1000;
var = 1+(j*10);    %%value for variance
v2 = 1+j;
n = var * randn(1,N);  
y = m + n;
y = y';
%plot(y)
%% Creating a Maximum Likelihood Estimator
est_m = (1/N)*sum(y);
v1(v2,i) = est_m;
end
end