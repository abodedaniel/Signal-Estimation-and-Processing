N_TF=8192;
Te = 1/Fe;
T = 5e-3;
s = A;
Num = 1;
e=zeros(1,length(s)+500); 
e(1:round(T/Te):length(s))=1;  %%input signal
t=(1:length(e))*Te;
s=[s zeros(1,length(t)-length(s))];
s_synthe=filter(Num,Den,e); s_synthe=s_synthe-mean(s_synthe);
TF_s_synthe=fft(s_synthe,N_TF);
figure(1);
subplot(211); plot(t,s,'b'); title('recorded A')
subplot(212); plot(t,e,'g'); title('input')
xlabel('t (s)'); figure(2);
subplot(211); plot(t,e,'g'); title('input')
subplot(212); plot(t,s_synthe,'r'); title('synthensized A');
xlabel('t (s)'); figure(3);
subplot(211); plot(t,s,'b'); title('recorded A')
subplot(212); plot(t,s_synthe,'r'); title('synthensized A');
xlabel('t (s)'); figure(4);
z=round(length(s)/4):round(length(s)/2);
subplot(211); plot(t(z)*1e3,s(z),'b'); title('recorded A')
subplot(212); plot(t(z)*1e3,s_synthe(z),'r'); title('synthesized A');
xlabel('t (*s)'); figure(5);
n=round(N/3);
TF_s=fft(s,N_TF); TF_s=TF_s(1:N_TF/2);
subplot(211); plot(f(1:n)*1e-3,abs(TF_s(1:n))/max(abs(TF_s)),'b');
title('Tranfer function of recorded A ');
subplot(212); plot(f(1:n)*1e-3,abs(TF_s_synthe(1:n))/max(abs(TF_s_synthe)),'r');
title('Transfer Function of synthesized A');
xlabel('f (kHz)'); 