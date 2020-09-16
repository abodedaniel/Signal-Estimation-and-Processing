function essai_tp(s,a,Te,T,K);

% essai_tp(s,a,Te,T,K);
%
% Cette fonction permet de tester les r�sultats des �tudiants.
%
% Entr�e : s  : signal de d�part
%          a  : param�tres du filtre
%          Te : p�riode d'�chantillonnage
%          T  : dur�e de chaque motif �l�mentaire
%          K : nombre de motifs �lementaires
%
% C�cile Durieu octobre 1999

N=length(s); t=(0:N-1)*Te; Fe=1/Te;
s=s(:)'; a=a(:);
e=zeros(1,length(s)); e(1:round(T/Te):length(s))=1;
s_synthe=filter(1,[1 -a(:)'],e);d_s=(max(s)-min(s))/2;
subplot(211); plot(t,s); xlabel('t (s)'); title('voyelle enregistr�e')
subplot(212); plot(t,s_synthe); xlabel('t (s)'); title('voyelle synth�tis�e')
figure(1); pause
s1=[s/max(abs(s)) zeros(1,5000)]; s2=[s_synthe/max(abs(s_synthe)) zeros(1,5000)];
sound(s2,Fe);
pause
sound(s1,Fe);
