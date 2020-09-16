function test;
load aeiou22
Te=t(2)-t(1); Fe=1/Te;

% séparation des différentes voyelles
sa= s(za); se=s(ze); si=s(zi); so=s(zo); su=s(zu);
ta=t(za); te=t(ze); ti=t(zi); to=t(zo); tu=t(zu);
sound(sa/max(abs(sa)),Fe);
pause(1)
sound(se/max(abs(se)),Fe);
pause(1)

wavplay(si/max(abs(si)),Fe); pause(0.5)
wavplay(so/max(abs(so)),Fe)
%wavrecord();