function Den=iden(s,d);

% function Den=iden(s,d);
%
% Cette fonction d�termine les coefficients du filtre AR
% d'ordre d avec la m�thode de Yule Walker. Le d�nominateur
% du filtre est  1-a(1)z^(-1)-a(2)z^(-2)-...-a(d)z^(-d).
% L'estimateur de la corr�lation est biais�.
%
% Entr�e : s signal
%          d ordre du filtre
% 
% Sortie : Den d�nominateur du filtre AR
%
% C�cile Durieu octobre 2001

s=s(:);N=length(s);
TF_s=fft(s,2*N);
c=real(ifft(TF_s.'.*TF_s'));
c=c(1:d+1)/N; c=c(:);
M=toeplitz(c(1:d));
a=inv(M)*c(2:d+1);
Den=[1 -a'];