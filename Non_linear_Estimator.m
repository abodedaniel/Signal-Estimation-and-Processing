clc
clear all
close all
%% generating and ploting y(t)
%% y (t) = a1 sin(2?f0t) + a2 sin(2?f1t) + n(t), t= 1,....,N
a1 = 1; 
a2 = 1;
f0 = 0.25;
f1 = 0.4;
i = 1; %counter
for std_dev = [0.1, 0.5, 1]; %standard devviation
m = 5; %%choose m = 5
N = 1000;
t = 1:1:N;
n = std_dev .* randn(1,N);  
y = (a1.*sin(2*pi*f0.*t)) + (a2.*sin(2*pi*f1.*t)) + n;
y = y';
hold on
subplot(3,1,i)

stem(y(1:1:100));
hold on
plot(y(1:1:100), 'r-');
hold off
title(['plot of y for variance = ' num2str(var(n))])
ylabel('Amplitude of Y')
xlabel('time t')
axis([1,100,-4,4])
i = i+1;
end

