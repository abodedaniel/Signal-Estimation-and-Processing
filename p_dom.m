function p=p_dom(Den);

% p=p_dom(Den);
%
% Cette fonction d�termine les 4 p�les dominants d'un filtre AR.
%
% Entr�e : Den d�nominateur du filtre AR
%
% Sortie : p p�les dominants
%
% Cecile Durieu octobre 2001

p=roots(Den);
i=find(imag(p)>=0); p=p(i); 
l=length(p);
[mod,i]=sort(abs(p));
p=p(i); p=p(l:-1:l-3);
[phase,i]=sort(angle(p));
p=p(i);