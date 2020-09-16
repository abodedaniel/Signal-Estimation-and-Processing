function recond(d);

% recond(d);
%
% Ce fonction permet de faire une démonstration de reconnaissance de voyelles.
%
% Cécile Durieu octobre 2000

choix=menu('   Données ',...
           'à déterminer ?  ',...
           '  à charger ?   ');
if choix==1
   [s1,Fe]=wavread(uigetfile('*.wav', 'Nom du 1er fichier à traiter',0,0));
   [s2,Fe]=wavread(uigetfile('*.wav', 'Nom du 2ème fichier à traiter',0,0));
   [s3,Fe]=wavread(uigetfile('*.wav', 'Nom du 3ème fichier à traiter',0,0));
   s1=(s1-mean(s1))'; s2=(s2-mean(s2))'; s3=(s3-mean(s3))'; Te=1/Fe;
   for i=1:3
       if i==1; s=s1; t=(1:length(s))*Te; end
       if i==2; s=s2; t=(1:length(s))*Te; end
       if i==3; s=s3; t=(1:length(s))*Te; end
          plot(t,s,'b'); xlabel('t (s)'); title('signal enregistré'); figure(1); pause
          disp(' '); disp(' Cliquez pour déterminer le début et la fin de chaque voyelle')
          position=ginput(10);
          Na1=round(position(1,1)/Te); Na2=round(position(2,1)/Te);  
          Ne1=round(position(3,1)/Te); Ne2=round(position(4,1)/Te);
          Ni1=round(position(5,1)/Te); Ni2=round(position(6,1)/Te); 
          No1=round(position(7,1)/Te); No2=round(position(8,1)/Te); 
          Nu1=round(position(9,1)/Te); Nu2=round(position(10,1)/Te); 
          N_TF=8192; f=(0:N_TF-1)/N_TF*Fe;
          N=Na2-Na1+1; sa=s(Na1:Na2);          
          a=iden(sa,d); coef_a(i,:)=a'; pa_dom(i,:)=p_dom(a)';
          [F_a(i,:),TF_F_a(i,:),TF_a(i,:)]=formants(sa,Te);
          N=Ne2-Ne1+1; se=s(Ne1:Ne2);
          a=iden(se,d); coef_e(i,:)=a'; pe_dom(i,:)=p_dom(a)';
          [F_e(i,:),TF_F_e(i,:),TF_e(i,:)]=formants(se,Te);
          N=Ni2-Ni1+1; si=s(Ni1:Ni2);
          a=iden(si,d); coef_i(i,:)=a'; pi_dom(i,:)=p_dom(a)';
          [F_i(i,:),TF_F_i(i,:),TF_i(i,:)]=formants(si,Te);
          N=No2-No1+1; so=s(No1:No2); 
          a=iden(so,d); coef_o(i,:)=a'; po_dom(i,:)=p_dom(a)';
          [F_o(i,:),TF_F_o(i,:),TF_o(i,:)]=formants(so,Te);
          N=Nu2-Nu1+1; su=s(Nu1:Nu2);
          a=iden(su,d); coef_u(i,:)=a'; pu_dom(i,:)=p_dom(a)';
          [F_u(i,:),TF_F_u(i,:),TF_u(i,:)]=formants(su,Te);
          end 
    else 
    load(uigetfile('carac*.mat', 'Nom du fichier contenant les caractéristiques des voyelles',0,0));
end
 
choix=1;
while choix==1;
      close all; clc;
      [s,Fe]=wavread(uigetfile('*.wav', 'Nom du fichier à traiter',0,0));
      Te=1/Fe; t=(1:length(s))*Te;
      s=(s-mean(s))';  
      plot(t,s,'b'); xlabel('t (s)'); title('signal enregistré'); figure(1); pause
      disp(' '); disp(' Cliquez pour déterminer le début et la fin de la voyelle choisie');disp(' ')
      position=ginput(2);
      N1=round(position(1,1)/Te); N2=round(position(2,1)/Te);  
      N=N2-N1+1; s=s(N1:N2);
      close all 
      a=iden(s,d); p=p_dom(a)'; [F,TF_F,TF]=formants(s,Te);
      coef=[a'; a'; a']; p=[p; p; p]; F=[F; F; F] ; TF_F=[TF_F; TF_F; TF_F]; TF=[TF; TF;TF];      da_coef=coef-coef_a; de_coef=coef-coef_e; di_coef=coef-coef_i; do_coef=coef-coef_o; du_coef=coef-coef_u; 
      da_p=p-pa_dom; de_p=p-pe_dom; di_p=p-pi_dom; do_p=p-po_dom; du_p=p-pu_dom; 
      da_F=F-F_a; de_F=F-F_e; di_F=F-F_i; do_F=F-F_o; du_F=F-F_u;
      TF_F_a=TF_F.*TF_F_a; TF_F_e=TF_F.*TF_F_e; TF_F_i=TF_F.*TF_F_i;
      TF_F_o=TF_F.*TF_F_o; TF_F_u=TF_F.*TF_F_u;
      da_TF=TF-TF_a; de_TF=TF-TF_e; di_TF=TF-TF_i; do_TF=TF-TF_o; du_TF=TF-TF_u;
      for i=1:3;
          dist_coef=[norm(da_coef(i,:)),norm(de_coef(i,:)),norm(di_coef(i,:)),norm(do_coef(i,:)),norm(du_coef(i,:))];
          dist_p=[norm(da_p(i,:)),norm(de_p(i,:)),norm(di_p(i,:)),norm(do_p(i,:)),norm(du_p(i,:))];
          dist_F=[norm(da_F(i,:)),norm(de_F(i,:)),norm(di_F(i,:)),norm(do_F(i,:)),norm(du_F(i,:))];
          dist_F=[norm(da_F(i,:)),norm(de_F(i,:)),norm(di_F(i,:)),norm(do_F(i,:)),norm(du_F(i,:))];
          dist_TF_F=[norm(da_F(i,:).*TF_F_a(i,:)),norm(de_F(i,:).*TF_F_e(i,:)),...
                norm(di_F(i,:).*TF_F_i(i,:)),norm(do_F(i,:).*TF_F_o(i,:)),norm(du_F(i,:).*TF_F_u(i,:))];
          dist_TF=[norm(da_TF(i,:)),norm(de_TF(i,:)),norm(di_TF(i,:)),norm(do_TF(i,:)),norm(du_TF(i,:))];
          ind=find(dist_coef==min(dist_coef)); r=zeros(1,5); r(ind)=1; resu_coef(i,:)=r;
          ind=find(dist_p==min(dist_p)); r=zeros(1,5); r(ind)=1; resu_p(i,:)=r;
          ind=find(dist_F==min(dist_F)); r=zeros(1,5); r(ind)=1; resu_F(i,:)=r;
          ind=find(dist_TF_F==min(dist_TF_F)); r=zeros(1,5); r(ind)=1; resu_TF_F(i,:)=r;
          ind=find(dist_TF==min(dist_TF)); r=zeros(1,5); r(ind)=1; resu_TF(i,:)=r;
      end
      
      s_resu_p=sum(resu_p); s_resu_coef=sum(resu_coef);
      s_resu_F=sum(resu_F); s_resu_TF_F=sum(resu_TF_F); s_resu_TF=sum(resu_TF);
      s_resu=(s_resu_p+s_resu_coef+s_resu_F+s_resu_TF_F+s_resu_TF);
      r_coef=num2str(resu_coef); r_p=num2str(resu_p);
      r_F=num2str(resu_F); r_TF_F=num2str(resu_TF_F); r_TF=num2str(resu_TF);
      s_resu=num2str(s_resu);
      clc
      
      disp(' ');
      disp('                a  e  i  o  u ')
      disp(' Résultat avec formants')
      disp([' 1er  fichier : ' r_F(1,:)])
      disp([' 2ème fichier : ' r_F(2,:)])
      disp([' 3ème fichier : ' r_F(3,:)])
     
      disp(' Résultat avec formants pondérés')
      disp([' 1er  fichier : ' r_TF_F(1,:)])
      disp([' 2ème fichier : ' r_TF_F(2,:)])
      disp([' 3ème fichier : ' r_TF_F(3,:)])
      
      disp(' Résultat avec TF')
      disp([' 1er  fichier : ' r_TF(1,:)])
      disp([' 2ème fichier : ' r_TF(2,:)])
      disp([' 3ème fichier : ' r_TF(3,:)])

      disp(' Résultat avec coefficients du filtre')
      disp([' 1er  fichier : ' r_coef(1,:)])
      disp([' 2ème fichier : ' r_coef(2,:)])
      disp([' 3ème fichier : ' r_coef(3,:)])
     
      disp(' Résultat avec pôles dominants')
      disp([' 1er  fichier : ' r_p(1,:)])
      disp([' 2ème fichier : ' r_p(2,:)])
      disp([' 3ème fichier : ' r_p(3,:)])
      
      disp(' ');
      disp(' Résultat global')
      disp(['              : ' s_resu])
      
      pause
      close all
      
      choix=menu('Voulez-vous recommencer ?',...
                 '           oui           ',...
                 '           non           ');
   end; 
      