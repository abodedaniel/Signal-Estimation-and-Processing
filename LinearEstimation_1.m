clear all
close all
clc
%% y(t) = m + n(t),  t = 1.....N
m = 5;
y = [];
n = [];
est_m = [];
std_d = 1;
i = 1; %%counter for filling y for different values of variance
for N = [10, 100, 1000, 10000, 100000]
    n = std_d * randn(N,1);
    y = m + n;
    est_m(i) = sum(y)/N;
    disp(['Estimated value for N = ' num2str(N) ' is ' num2str(est_m(i))])
    i = i+1;
end


