function [k,c]=c_p(x,y,d);

% [k,c]=c_p(x,y,d);
%
% Cette fonction calcule l'intercorr�lation de puissance des signaux
% x et y en passant dans le domaine fr�quentiel.
% L'estimateur est biais�.
%
% Entree : x 1er signal � analyser
%          y 2�me signal � analyser
%
% Sortie : k vecteur des indices pour le calcul la corr�lation
%            (0,...,d)
%          c corr�lation calcul�e en k
%
% C�cile DURIEU octobre 1999

x=x(:); y=y(:);
N=length(x);
c=real(ifft(fft(x,2*N).'.*fft(y,2*N)'));
c1=c(N+2:2*N)'; c2=c(1:N)';
c=[c1(N-d:N-1);c2(1:d+1)]/N;
k=-d:d;
