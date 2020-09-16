clc
clear all
close all
%% y(t) = m + n(t) t= 1,....,N
est_m = zeros(1,1000);
b = zeros(1,100);
i = 1;
for N = 10:1000:100000
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
%%calculating the bias
b(i) = exp_est_m - m;
b(i) = abs(b(i));
i = i+1;
end
plot(10:1000:100000,b);
title('plot of bias vs N')
xlabel('values of N')
ylabel('bias')
