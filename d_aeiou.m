function d_aeiou(d);

% function d_aeiou(d);
%
% Cette fonction permet de faire une démonstration de synthèse de voyelles.
% Toutes les voyelles enregistrées sont stockées dans le fichier aeiou22.mat.
% Les voyelles synthétisées sont stockées dans le fichier synthe22.mat
% 
% Entrée : d ordre du filtre
%
% Cécile Durieu octobre 2000

load aeiou22
Te=t(2)-t(1); Fe=1/Te;

% Visualisation des différentes voyelles
plot(t,s); xlabel('t (s)'); title('a e i o u enregistrés')
figure(1); pause

% séparation des différentes voyelles
sa= s(za); se=s(ze); si=s(zi); so=s(zo); su=s(zu);
ta=t(za); te=t(ze); ti=t(zi); to=t(zo); tu=t(zu);

% visualisation des voyelles
z1=1001:2000; z2=1001:1500;
plot(ta(z1)*1e3,sa(z1),'b'); xlabel('t (ms)'); title('zoom a'); 
axis([ta(z1(1))*1e3 ta(z1(1000))*1e3 -max(abs(sa)) max(abs(sa))]); figure(1); pause
plot(ta(z2)*1e3,sa(z2),'b'); xlabel('t (ms)'); title('zoom a'); 
axis([ta(z2(1))*1e3 ta(z2(500))*1e3 -max(abs(sa)) max(abs(sa))]); figure(1); pause
plot(te(z1)*1e3,se(z1),'b'); xlabel('t (ms)'); title('zoom e');
axis([te(z1(1))*1e3 te(z1(1000))*1e3 -max(abs(se)) max(abs(se))]); figure(1); pause
plot(te(z2)*1e3,se(z2),'b'); xlabel('t (*s)'); title('zoom e'); 
axis([te(z2(1))*1e3 te(z2(500))*1e3 -max(abs(se)) max(abs(se))]); figure(1); pause
plot(ti(z1)*1e3,si(z1),'b'); xlabel('t (ms)'); title('zoom i'); 
axis([ti(z1(1))*1e3 ti(z1(1000))*1e3 -max(abs(si)) max(abs(si))]); figure(1); pause
plot(ti(z2)*1e3,si(z2),'b'); xlabel('t (ms)'); title('zoom i'); 
axis([ti(z2(1))*1e3 ti(z2(500))*1e3 -max(abs(si)) max(abs(si))]); figure(1); pause
plot(to(z1)*1e3,so(z1),'b'); xlabel('t (ms)'); title('zoom o'); 
axis([to(z1(1))*1e3 to(z1(1000))*1e3 -max(abs(so)) max(abs(so))]); figure(1); pause
plot(to(z2)*1e3,so(z2),'b'); xlabel('t (ms)'); title('zoom o'); 
axis([to(z2(1))*1e3 to(z2(500))*1e3 -max(abs(so)) max(abs(so))]); figure(1); pause
plot(tu(z1)*1e3,su(z1),'b'); xlabel('t (ms)'); title('zoom u'); 
axis([tu(z1(1))*1e3 tu(z1(1000))*1e3 -max(abs(su)) max(abs(su))]); figure(1); pause
plot(tu(z2)*1e3,su(z2),'b'); xlabel('t (ms)'); title('zoom u'); 
axis([tu(z2(1))*1e3 tu(z2(500))*1e3 -max(abs(su)) max(abs(su))]); figure(1); pause
close all

% Etude d'une voyelle
rep=menu(' Choix de la voyelle étudiée ',...
         '              a              ',...
         '              e              ',...
         '              i              ',...
         '              o              ',...
         '              u              ');
if rep==1; z=za; end; if rep==2; z=ze; end; if rep==3; z=zi; end;
if rep==4; z=zo; end; if rep==5; z=zu; end
z=z(1)-500:z(length(z))+500;
plot(t(z),s(z),'b'); xlabel('t (s)'); title('voyelle étudiée');
figure(1); pause
disp(' ')
disp(' Cliquez deux fois pour déterminer le début et la fin de la voyelle')
position=ginput(2);
N1=round(position(1,1)/Te); N2=round(position(2,1)/Te);  N=N2-N1+1;
t=t(1:N)-t(1); s=s(N1:N2); s=s-mean(s);

s_synthe=synthe(t,s,Te,d);
s1=[s/max(abs(s)) zeros(1,5000)]; s2=[s_synthe/max(abs(s_synthe)) zeros(1,5000)];
sound([s1 s2],Fe);
disp(' Appuyez sur une touche pour continuer')

disp(' ')
disp(' Ecoute des voyelles enregistrées puis synthétisées');
pause
load synthe22
z=zeros(1,10000);
a=a/max(abs(a)); e=e/max(abs(e)); i=i/max(abs(i)); o=o/max(abs(o)); u=u/max(abs(u)); 
s=[a z e z i z o z u z];
a_synthe=a_synthe/max(abs(a_synthe)); e_synthe=e_synthe/max(abs(e_synthe));
i_synthe=i_synthe/max(abs(i_synthe)); o_synthe=o_synthe/max(abs(o_synthe));
u_synthe=u_synthe/max(abs(u_synthe)); 
s_synthe=[a_synthe z e_synthe z i_synthe z o_synthe z u_synthe z];
sound([s s_synthe],Fe);