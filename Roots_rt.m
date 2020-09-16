clc
%% calculating the roots of the polynomial 
rt = roots(Den);
plot(real(rt), imag(rt), '*')
title('Plot of roots in complex plane');
ylabel('Imaginary');
xlabel('Real');

%% calculating the modulus and phases of rt
modulus = abs(rt);
ang = angle(rt);