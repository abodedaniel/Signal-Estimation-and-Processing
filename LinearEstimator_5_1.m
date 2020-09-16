clc
clear all
close all
%% realizing the variance of the estimator as a function of N
%% y(t) = m + n(t) t= 1,....,N
est_m = zeros(1,1000);
var_est_m = zeros(1,10);
i = 1;
for N = 10:1000:10000
for mc = 1:1000
m = 5; %%choose m = 5
n = randn(1,N);  
y = m + n;
y = y';
%plot(y)
%% Creating a Maximum Likelihood Estimator
est_m(mc) = (1/(N-1))*sum(y);
end
exp_est_m = sum(est_m)/mc;
%%calculating the variance of 
var_est_m(i) = (sum((est_m - exp_est_m).^2))/mc;
i = i+1;
end
subplot(2,1,1)
plot(10:1000:10000,var_est_m);
title('plot of var(mˆML), for sigma^2 = 1 constant and N changing')
ylabel('var(mˆML)')
xlabel('N')