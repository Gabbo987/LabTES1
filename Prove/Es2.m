clear all
close all
clc

[y, Fs] = audioread("Metallica - Fuel.wav", [1323001 2646000]);

ly = length(y);
t = ly / Fs;
M = 0.5;
l_int = Fs * M;
n_int = t / M;

x = zeros(n_int, l_int);
for i = 1:n_int
    a = (i-1)*l_int + 1;
    b = i*l_int;
    x(i, :) = y(a:b , 1);
end


X = zeros(n_int, l_int/2);
for i = 1:n_int
    xt = fft(x(i, :)) - mean(x(i, :));
    xtp = xt(1:l_int/2);
    X(i, :) = 10*log10(abs(xtp).^2 + 1e-12);

    figure
    plot(linspace(0, (l_int-1)/2, l_int/2), X(i, :));
    title(sprintf("%do intervallo", i));
    xlabel("Freq [kHz]");
    ylabel("En [dB]");
end

save("X.mat", "X");

