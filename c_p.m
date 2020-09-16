function [k,c]=c_p(x,y,d);

% [k,c]=c_p(x,y,d);
%
% Cette fonction calcule l'intercorrélation de puissance des signaux
% x et y en passant dans le domaine fréquentiel.
% L'estimateur est biaisé.
%
% Entree : x 1er signal à analyser
%          y 2ème signal à analyser
%
% Sortie : k vecteur des indices pour le calcul la corrélation
%            (0,...,d)
%          c corrélation calculée en k
%
% Cécile DURIEU octobre 1999

x=x(:); y=y(:);
N=length(x);
c=real(ifft(fft(x,2*N).'.*fft(y,2*N)'));
c1=c(N+2:2*N)'; c2=c(1:N)';
c=[c1(N-d:N-1);c2(1:d+1)]/N;
k=-d:d;
