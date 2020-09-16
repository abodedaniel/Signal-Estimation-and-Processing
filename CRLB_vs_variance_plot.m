clc
clear all
close all
%% y(t) = m + n(t) t= 1,....,N
est_m = zeros(1,1000);
var_est_m = zeros(1,10);
i = 1;
N = 1000;
CRLB = zeros(1,10);
for v = 1:1:10
for mc = 1:1000
m = 5; %%choose m = 5
n = v .* randn(1,N);  
y = m + n;
y = y';
%plot(y)
%% Creating a Maximum Likelihood Estimator
est_m(mc) = (1/(N))*sum(y);
end
%% expectation of the Maximum Likelihood Estimator
exp_est_m = sum(est_m)/mc;
%%calculating the variance of 
var_est_m(i) = (sum((est_m - exp_est_m).^2))/mc;
CRLB(i) = v/N;
i = i+1;

end
plot((1:1:10).^2,var_est_m);
title('Comparing the CRLB to the variance')
ylabel('var(mˆML)')
xlabel('sigma^2')
hold on
plot((1:1:10).^2,CRLB,'r-');
legend('var(mˆML)','CRLB');
