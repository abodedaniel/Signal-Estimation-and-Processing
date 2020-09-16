function s_synthe=synthe(t,s,Te,d);

% s_synthe=synthe(t,s,Te,d);
%
% Cette fonction synth�tise la voyelle s avec un mod�le d'ordre AR d'ordre d.
%
% Entr�e : t  temps
%          s  signal � synth�tiser
%          Te p�riode d'�chantillonnage 
%          d  ordre du filtre
%
% Sortie : s_synthe signal synth�tis�
%
% C�cile Durieu octobre 2001

N=length(s); Fe=1/Te;
plot(t,s,'b'); xlabel('t (s)'); title('voyelle �tudi�e'); figure(1); pause
disp(' Zoomez pour d�terminer la p�riode du fondamental')
zoom on; pause; zoom off; grid
disp(' Cliquez deux fois pour d�terminer la p�riode du fondamental')
position=ginput(2); T=abs(position(2,1)-position(1,1));
K=round(t(N)/T)

% Spectre
N_TF=8192; f=(0:N_TF/2-1)/N_TF/Te; n=round(N_TF/3); 
TF_s=fft(s,N_TF); TF_s=TF_s(1:N_TF/2);
plot(f(1:n)*1e-3,abs(TF_s(1:n))/max(abs(TF_s)),'b'); xlabel('f (kHz)');
title('TF voyelle enregistr�e '); figure(1); pause

% Identification 
Num=1;
Den=iden(s,d); 
poles=roots(Den); zplane(poles); title('p�les du filtre'); figure(1); pause
p=p_dom(Den); hold on; polar(angle(p),abs(p),'or'); pause
m=max(abs(roots(Den)));
hold off
fprintf(' module maximum des p�les : %g \n',m);
close all
[ri,t_ri]=impz(Num,Den,[],Fe);
plot(t_ri*1e3,ri,'r'); grid; xlabel('t (ms)'); title('RI du filtre'); figure(1); pause
[H,fH]=freqz(Num,Den,f,Fe);
plot(fH*1e-3,abs(H),'r'); xlabel('f (kHz)'); title('RF du filtre ');
figure(1); pause

plot(f(1:n)*1e-3,abs(TF_s(1:n))/max(abs(TF_s)),'b',...
     fH*1e-3,abs(H)/max(abs(H)),'r'); 
xlabel('f (kHz)'); title('RF du filtre et TF voyelle (normalis�e)');
figure(1); pause

% Synth�se
e=zeros(1,length(s)+500); e(1:round(T/Te):length(s))=1;
t=(1:length(e))*Te;
s=[s zeros(1,length(t)-length(s))];
s_synthe=filter(Num,Den,e); s_synthe=s_synthe-mean(s_synthe);
TF_s_synthe=fft(s_synthe,N_TF);
subplot(211); plot(t,s,'b'); title('voyelle enregistr�e')
subplot(212); plot(t,e,'g'); title('entr�e')
xlabel('t (s)'); figure(1); pause
subplot(211); plot(t,e,'g'); title('entr�e')
subplot(212); plot(t,s_synthe,'r'); title('voyelle synth�tis�e');
xlabel('t (s)'); figure(1); pause
subplot(211); plot(t,s,'b'); title('voyelle enregistr�e')
subplot(212); plot(t,s_synthe,'r'); title('voyelle synth�tis�e');
xlabel('t (s)'); figure(1); pause
z=round(length(s)/4):round(length(s)/2);
subplot(211); plot(t(z)*1e3,s(z),'b'); title('voyelle enregistr�e')
subplot(212); plot(t(z)*1e3,s_synthe(z),'r'); title('voyelle synth�tis�e');
xlabel('t (*s)'); figure(1); pause
n=round(N/3);
subplot(211); plot(f(1:n)*1e-3,abs(TF_s(1:n))/max(abs(TF_s)),'b');
title('TF voyelle enregistr�e ');
subplot(212); plot(f(1:n)*1e-3,abs(TF_s_synthe(1:n))/max(abs(TF_s_synthe)),'r');
title('TF voyelle synth�tis�e');
xlabel('f (kHz)'); figure(1); pause
