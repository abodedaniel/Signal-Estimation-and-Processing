% Ce programme permet de faire une d�monstration de synthese de voyelles
% � partir d'un enregistrement qui est fait dans un fichier *.wav qui
% est choisi avec un menu.
%
% C�cile Durieu octobre 1999

[s,Fe]=wavread(uigetfile('*.wav', 'Nom du Fichier � traiter',0,0));
s=s(:)'; s=s-mean(s);
Te=1/Fe; t=(1:length(s))*Te;
plot(t,s); xlabel('t (s)'); title('signal enregistr�')
figure(1); pause
disp(' ');
disp(' Cliquez deux fois pour d�terminer le d�but et la fin de la voyelle')
position=ginput(2);
N1=round(position(1,1)/Te); N2=round(position(2,1)/Te);  
N=N2-N1+1; t=t(1:N); s=s(N1:N2);

s_synthe=synthe(t,s,Te,d);

s1=[s/max(s) zeros(1,5000)]; s2=[s_synthe/max(s_synthe) zeros(1,5000)];
sound([s1 s2],Fe);