function demo;

% demo;
%
% Cette fonction programme permet de faire une d�monstration de synth�se et 
% reconnaissance de voyelles.
%
% C�cile Durieu octobre 2001

d=20; % ordre du filtre
boucle=1;
while boucle==1;
      close all;
      clc;
	   choix=menu('   Choix de la d�monstration   ',...
			        'synth�se de toutes les voyelles',...
		  		     'synth�se d''une seule voyelle ',....
   	    	     '  reconnaissance de voyelles   ',...
	   		     '              fin              '); 
		if choix==1; d_aeiou(d); end
		if choix==2; demo_1(d); end
		if choix==3; recon(d); end
		if choix==4; boucle=0; end
end