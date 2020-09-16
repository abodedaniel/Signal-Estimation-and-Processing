clear all
close all
clc
%% y(t) = m + n(t),  t = 1.....N
m = 5;
N= 1000;
t = 1:1:N
y = zeros(N,5);
n = zeros(N,1);
std_d = 1;
i = 1;   %%counter for filling y for different values of variance
for std_d = 0.1:0.2:1
    n = std_d * randn(N,1);
    y(:,i) = m + n;
    subplot(5,1,i);
    stem(t(1:100),y(1:100,i));
    title(['Plot of y for variance = ' num2str(var(y(:,i)))])
    xlabel('time(1:100)')
    ylabel('Amplitude')
    i = i+1;
end


