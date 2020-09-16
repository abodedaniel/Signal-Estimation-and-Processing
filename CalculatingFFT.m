clc
%% calculating the fourier trasnform of the signal A and plotting it
L = 3930;   %length of the signal
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(A,NFFT)/L;
f = Fe/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of A')
xlabel('Frequency (Hz)')
ylabel('Magnitude of the FFT of A')