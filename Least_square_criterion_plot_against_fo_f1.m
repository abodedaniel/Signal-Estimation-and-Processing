%% a1 and a2 must be set to one in Least_square_criterion.m
%% a1=a2=1 and variance constant, this code plot J(fo,f1) vs fo, f1 in a 3D plot
clc
close all
%% y (t) = a1 sin(2?f0t) + a2 sin(2?f1t) + n(t), t= 1,....,N
i = 1;
k = 1;
J1 = zeros(length(0:0.01:0.5),length(0:0.01:0.5));
for f1 = 0:0.01:0.5
    for f0 = 0:0.01:0.5
        J = (y - (a1.*sin(2*pi*f0.*t')) - (a2.*sin(2*pi*f1.*t'))).^2;
        J1(i,k) = sum(J);
        k = k+1;
    end
    i = i+1;
    k=1;
end
surf(0:0.01:0.5,0:0.01:0.5,J1);
title('Plot of J(fo,f1) vs fo, fi')
xlabel('values of fo')
ylabel('values of f1')
zlabel('Amplitude of J(fo,f1)')
%[f0_value,f1_value,J_value] = ginput(1) %picking the minimum coordinates
%plot3(0:0.01:0.5,0:0.01:0.5,J1);