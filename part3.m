clc
clear 
close all

data=load('datafile.mat');
signal=data.x_noise;
plot(signal);
fft_signal = fft(signal);
plot(abs(fft_signal));
[peaks, freqs] = findpeaks(abs(fft_signal));
[~, idx] = sort(peaks, 'descend');
peak_freqs = freqs(idx(1:3));
noise_threshold = max(abs(fft_signal)) / 2;
clean_fft_signal = fft_signal;
clean_fft_signal(abs(fft_signal) < noise_threshold) = 0;
plot(abs(clean_fft_signal));
clean_signal = ifft(clean_fft_signal);
plot(real(clean_signal));
[~, idx] = findpeaks(real(clean_signal), 'MinPeakDistance', 100);
subplot(3,1,1);
plot(real(clean_signal));
hold on;
plot(idx(1), real(clean_signal(idx(1))), 'ro');
subplot(3,1,2);
plot(real(clean_signal));
hold on;
plot(idx(2), real(clean_signal(idx(2))), 'ro');
subplot(3,1,3);
plot(real(clean_signal));
hold on;
plot(idx(3), real(clean_signal(idx(3))), 'ro');