clc
clear all
close all
%%Noises - Using rand to create a vector of random variables
v = rand(1,10);   %vector v of size 10
figure
subplot(2,1,1);   %creating a subplot
plot(v);          %plot vector
title('plot of vector v of size 10')
ylabel('Amplitude')
xlabel('Number of elements in vector v')
subplot(2,1,2);
hist(v);         %use hist to plot approximate pdf
title('Approximate pdf of vector v of size 10')
ylabel('Frequency')
xlabel('Elements in vector v')
v_mean_1 = mean(v)   %mean of vector v
v_var_1 = var(v)     %variance of vector v

%repeating above vector v of size 10000
v = rand(1,10000);  
figure
subplot(2,1,1);
plot(v);
title('plot of vector v of size 10000')
ylabel('Amplitude')
xlabel('Number of elements in vector v')
subplot(2,1,2);
hist(v);         %use hist to plot approximate pdf
title('Approximate pdf of vector v of size 10000')
ylabel('Frequency')
xlabel('Elements in vector v')
v_mean_2 = mean(v)    %mean of vector v
v_var_2 = var(v)      %variance of vector v

%% Using randn() to generate v for size 10
v = randn(1,10);
figure
subplot(2,1,1)
plot(v);
title('plot of vector v of size 10')
ylabel('Amplitude')
xlabel('Number of elements in vector v')
subplot(2,1,2)
hist(v);
title('Approximate pdf of vector v of size 10')
ylabel('Frequency')
xlabel('Elements in vector v')
v_mean_1 = mean(v)  %mean of vector v
v_var_1 = var(v)    %variance of vector v

%% Repeating using randn() to generate v for size 10000
v = randn(1,10000); 
figure
subplot(2,1,1)
plot(v);
title('plot of vector v of size 10000')
ylabel('Amplitude')
xlabel('Number of elements in vector v')
subplot(2,1,2)
hist(v);
title('Approximate pdf of vector v of size 10000')
ylabel('Frequency')
xlabel('Elements in vector v')
v_mean_2 = mean(v)  %mean of vector v
v_var_2 = var(v)    %variance of vector v

