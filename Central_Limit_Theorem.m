clc
clear all
close all
%%Central Limit Theorem
S = zeros(1,1000);   %%declaring vector S
for j = 1:1000
    N = 10;       %%value of N
    a = -1;
    b = 1;
    ni = a+(b-a)*rand(1,N);  %%generating ni for size N
    S(j) = sum(ni);          %%summing ni and storing in S
end
subplot(3,1,1)
hist(S);
title('Approximate pdf of Sj for size N = 10');
ylabel('Frequency')
xlabel('values of Sj')

%% Repeated for N = 1000
for j = 1:1000
    N = 1000;       %%value of N
    a = -1;
    b = 1;
    ni = a+(b-a)*rand(1,N);  %%generating ni for size N
    S(j) = sum(ni);          %%summing ni and storing in S
end
subplot(3,1,2)
hist(S);
title('Approximate pdf of Sj for size N = 10000');
ylabel('Frequency')
xlabel('values of Sj')

%% Repeated for size N = 100000
for j = 1:1000
    N = 100000;       %%value of N
    a = -1;
    b = 1;
    ni = a+(b-a)*rand(1,N);  %%generating ni for size N
    S(j) = sum(ni);          %%summing ni and storing in S
end
subplot(3,1,3)
hist(S);
title('Approximate pdf of Sj for size N = 100000');
ylabel('Frequency')
xlabel('values of Sj')
