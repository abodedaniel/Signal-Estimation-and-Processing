function demo;

% demo;
%
% Cette fonction programme permet de faire une démonstration de synthèse et 
% reconnaissance de voyelles.
%
% Cécile Durieu octobre 2001

d=20; % ordre du filtre
boucle=1;
while boucle==1;
      close all;
      clc;
	   choix=menu('   Choix de la démonstration   ',...
			        'synthèse de toutes les voyelles',...
		  		     'synthèse d''une seule voyelle ',....
   	    	     '  reconnaissance de voyelles   ',...
	   		     '              fin              '); 
		if choix==1; d_aeiou(d); end
		if choix==2; demo_1(d); end
		if choix==3; recon(d); end
		if choix==4; boucle=0; end
end