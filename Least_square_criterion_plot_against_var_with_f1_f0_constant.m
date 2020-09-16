clc
close all
%% y (t) = a1 sin(2?f0t) + a2 sin(2?f1t) + n(t), t= 1,....,N
f0 = 0.25;
f1 = 0.4;
m = 5; %%choose m = 5
N = 10000;
t = 1:1:N;
i=1;
var_ = zeros(length(1:0.2:10),1);
J1 = zeros(length(1:0.2:10),1);
for s_d = 1:0.2:10
    n1 = s_d .* n; 
    y = (a1.*sin(2*pi*f0.*t)) + (a2.*sin(2*pi*f1.*t)) + n1;
    var_(i) = var(y);
    y = y';
    J = (y - (a1.*sin(2*pi*f0.*t')) - (a2.*sin(2*pi*f1.*t'))).^2;
    J1(i) = sum(J);
    i = i + 1;
end
plot(var_,J1)