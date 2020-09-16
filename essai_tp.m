function essai_tp(s,a,Te,T,K);

% essai_tp(s,a,Te,T,K);
%
% Cette fonction permet de tester les résultats des étudiants.
%
% Entrée : s  : signal de départ
%          a  : paramètres du filtre
%          Te : période d'échantillonnage
%          T  : durée de chaque motif élémentaire
%          K : nombre de motifs élementaires
%
% Cécile Durieu octobre 1999

N=length(s); t=(0:N-1)*Te; Fe=1/Te;
s=s(:)'; a=a(:);
e=zeros(1,length(s)); e(1:round(T/Te):length(s))=1;
s_synthe=filter(1,[1 -a(:)'],e);d_s=(max(s)-min(s))/2;
subplot(211); plot(t,s); xlabel('t (s)'); title('voyelle enregistrée')
subplot(212); plot(t,s_synthe); xlabel('t (s)'); title('voyelle synthétisée')
figure(1); pause
s1=[s/max(abs(s)) zeros(1,5000)]; s2=[s_synthe/max(abs(s_synthe)) zeros(1,5000)];
sound(s2,Fe);
pause
sound(s1,Fe);
