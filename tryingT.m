% Assume we capture 8192 samples at 1kHz sample rate
Nsamps = 8192;
fsamp = 1000;
Tsamp = 1/fsamp;
t = (0:Nsamps-1)*Tsamp;
% Assume the noisy signal is exactly 123Hz
fsig = 123;
signal = sin(2*pi*fsig*t);
noise = 1*randn(1,Nsamps);
x = signal + noise;
% Plot time-domain signal
subplot(2,1,1);
plot(t, x);
ylabel('Amplitude'); xlabel('Time (secs)');
axis tight;
title('Noisy Input Signal');
% Choose FFT size and calculate spectrum
Nfft = 1024;
[Pxx,f] = pwelch(A,gausswin(Nfft),Nfft/2,Nfft,Fe);
% Plot frequency spectrum
subplot(2,1,2);
plot(f,Pxx);
ylabel('PSD'); xlabel('Frequency (Hz)');
grid on;
% Get frequency estimate (spectral peak)
[~,loc] = max(Pxx);
FREQ_ESTIMATE = f(loc)
title(['Frequency estimate = ',num2str(FREQ_ESTIMATE),' Hz']);