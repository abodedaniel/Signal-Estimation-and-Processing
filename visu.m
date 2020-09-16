% Visualisation des différentes voyelles
%
% Cécile Durieu octobre 2000

plot(t,s); xlabel('t (s)'); title('a e i o u enregistrés')
figure(1); pause

% séparation des différentes voyelles
sa= s(za); se=s(ze); si=s(zi); so=s(zo); su=s(zu);
ta=t(za); te=t(ze); ti=t(zi); to=t(zo); tu=t(zu);

% visualisation des voyelles
z1=1001:2000; z2=1001:1500;
plot(ta(z1),sa(z1),'b'); xlabel('t (s)'); title('zoom a'); 
axis([ta(z1(1)) ta(z1(1000)) -max(abs(sa)) max(abs(sa))]); figure(1); pause
plot(ta(z2),sa(z2),'b'); xlabel('t (s)'); title('zoom a'); 
axis([ta(z2(1)) ta(z2(500)) -max(abs(sa)) max(abs(sa))]); figure(1); pause
plot(te(z1),se(z1),'b'); xlabel('t (s)'); title('zoom e');
axis([te(z1(1)) te(z1(1000)) -max(abs(se)) max(abs(se))]); figure(1); pause
plot(te(z2),se(z2),'b'); xlabel('t (s)'); title('zoom e'); 
axis([te(z2(1)) te(z2(500)) -max(abs(se)) max(abs(se))]); figure(1); pause
plot(ti(z1),si(z1),'b'); xlabel('t (s)'); title('zoom i'); 
axis([ti(z1(1)) ti(z1(1000)) -max(abs(si)) max(abs(si))]); figure(1); pause
plot(ti(z2),si(z2),'b'); xlabel('t (s)'); title('zoom i'); 
axis([ti(z2(1)) ti(z2(500)) -max(abs(si)) max(abs(si))]); figure(1); pause
plot(to(z1),so(z1),'b'); xlabel('t (s)'); title('zoom o'); 
axis([to(z1(1)) to(z1(1000)) -max(abs(so)) max(abs(so))]); figure(1); pause
plot(to(z2),so(z2),'b'); xlabel('t (s)'); title('zoom o'); 
axis([to(z2(1)) to(z2(500)) -max(abs(so)) max(abs(so))]); figure(1); pause
plot(tu(z1),su(z1),'b'); xlabel('t (s)'); title('zoom u'); 
axis([tu(z1(1)) tu(z1(1000)) -max(abs(su)) max(abs(su))]); figure(1); pause
plot(tu(z2),su(z2),'b'); xlabel('t (s)'); title('zoom u'); 
axis([tu(z2(1)) tu(z2(500)) -max(abs(su)) max(abs(su))]); figure(1); pause