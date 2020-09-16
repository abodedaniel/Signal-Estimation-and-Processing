clc
close all
%% y (t) = a1 sin(2?f0t) + a2 sin(2?f1t) + n(t), t= 1,....,N
%% plotting the Least square criterion as a function of fo with fixed variance
a1 = 1;
a2 = 1;
i = 1;
J1 = zeros(length(0:0.01:0.5),1);
for f0 = 0:0.01:0.5
J = (y - (a1.*sin(2*pi*f0.*t')) - (a2.*sin(2*pi*f1.*t'))).^2;
J = sum(J);
J1(i) = J;
i = i+1;
end
plot(0:0.01:0.5,J1);
title('Plot of J as a function of fo for a1 = 1 and a2 = 1')
ylabel('magnitude of J')
xlabel('values of fo')
[f0_value,J_value] = ginput(1); %picking the minimum coordinates
disp('minimum coordinate of J as picked by manually by ginput() is')
disp(['value for f0 = ' num2str(f0_value)])
disp(['at J = ' num2str(J_value)])