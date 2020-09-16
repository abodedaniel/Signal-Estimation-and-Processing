function [F,TF_max,TF]=formants(s,Te);

% [F,TF_max,TF]=formants(s,Te);
%
% Cette fonction d�termine les principaux formants d'une voyelle.
%
% Entr�e : s  signal � synth�tiser
%          Te p�riode d'�chantillonnage 
%
% Sortie : F      fr�quence de formants
%          TF_max fr�quence pour lesquelles la TF pr�sente un maximum
%          Tf     TF
%
% C�cile Durieu octobre 2001

N=length(s); t=(0:N-1)*Te; Fe=1/Te;
plot(t,s,'b'); xlabel('t (s)'); title('voyelle �tudi�e');
figure(1); pause
disp(' Zoomez pour d�terminer la p�riode du fondamental')
zoom on; pause; zoom off; grid
disp(' Cliquez deux fois pour d�terminer la p�riode du fondamental')
position=ginput(2); T=abs(position(2,1)-position(1,1));
N_TF=8192; f=(0:N_TF-1)*Fe/N_TF; TF=abs(fft(s,N_TF));
Fo=1/T; No=round(Fo/Fe*N_TF); n=round(0.1*No);
i_max=20;
z=No-n:No+n;
TF_max(1)=max(TF(z));
j(1)=z(find(TF(z)==TF_max(1)));
F(1)=f(j(1));
Fo=F(1); No=round(Fo/Fe*N_TF); n=round(0.1*No);
for i=2:i_max;
   z=i*No-n:i*No+n;
   TF_max(i)=max(TF(z));
   j(i)=z(find(TF(z)==TF_max(i)));
   F(i)=f(j(i));
end
TF_max=TF_max/norm(TF_max); TF=TF_max;
% Recherche des maximums ---> formants
d_TF=TF_max(2:i_max)-TF_max(1:i_max-1); 
s=sign(d_TF); d_s=s(2:i_max-1)-s(1:i_max-2); 
j=find(d_s<0); j=j+1;
if TF_max(1)>TF_max(2) j=[1 j]; end
%TF_max=TF(ind);
F=round(F(j)/Fo); TF_max=TF_max(j);
[TF_F i]=sort(TF_max); 
i=i(length(i):-1:length(i)-3); 
F=F(i); TF_max=TF_max(i);
[j,k]=sort(i);
F=F(k); TF_max=TF_max(k);
