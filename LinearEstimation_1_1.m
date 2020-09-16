clear all
close all
clc
%% realization of the performance of the estimator for various value of variance
%% y(t) = m + n(t),  t = 1.....N
m = 5;
y = [];
n = [];
est_m = [];
N = 1000;
i = 1; %%counter for filling y for different values of variance
for std_d = [2, 4, 6, 8, 10]
    n = std_d * randn(N,1);
    y = m + n;
    est_m(i) = sum(y)/N;
    disp(['Estimated value for variance = ' num2str(var(y)) ' is ' num2str(est_m(i))])
    i = i+1;
end


