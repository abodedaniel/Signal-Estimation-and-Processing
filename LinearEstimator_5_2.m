clc
%% realizing the variance of the estimator as a function of N
%% y(t) = m + n(t) t= 1,....,N
est_m = zeros(1,1000);
p = zeros(1,10);
var_est_m = zeros(1,10);
i = 1;
N = 1000;
for v = 1:1:10
for mc = 1:1000
m = 5; %%choose m = 5
n = v .* randn(1,N);  
y = m + n;
y = y';
%plot(y)
%% Creating a Maximum Likelihood Estimator
est_m(mc) = (1/(N-1))*sum(y);
end
exp_est_m = sum(est_m)/mc;
%%calculating the variance of 
var_est_m(i) = (sum((est_m - exp_est_m).^2))/mc;
p(i) = var(est_m);
i = i+1;
end
subplot(2,1,2)
plot((1:1:10).^2,var_est_m);
title('plot of var(mˆML), for N=1000 constant and sigma^2 changing')
ylabel('var(mˆML)')
xlabel('sigma^2')
hold on
plot((1:1:10).^2,p);
