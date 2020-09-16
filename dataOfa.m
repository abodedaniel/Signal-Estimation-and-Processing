%% plotting a and selecting the useful part into variable A
close all
subplot(2,1,1)
plot(a)
title('plot of the data of "a"')
ylabel('Amplitude')
xlabel('time')
A = a(1:3930); %%the useful part of a
subplot(2,1,2)
plot(A)
title('plot of A (useful part of "a") ')
ylabel('Amplitude')
xlabel('time')