clear all
close all
clc

load handel;

% Separazione dei campioni in intervalli

ly = length(y);
l_int = Fs*0.5;
t = ly / Fs;

tc = linspace(0, t, ly);

vect = zeros(18, l_int);

for i = 1:17
    a = (i-1)*l_int + 1;
    b = i*l_int;
    vect(i,:) = y(a:b);
end

vect(18, :) = y(17*l_int + 1, :);

figure
hold on
plot(tc, y./max(y));
title("Campioni");

%Discrete Fourier Transform

Z = zeros(18, l_int);

for i = 1:18
    Z(i, :) = fftshift(dft2(vect(i, :)));
end

figure
hold on 
plot(0:l_int-1, Z(1, :));
title("DFT2");

%Fast Fourier Transform


Y = zeros(18, l_int);

for i = 1:18
    Y(i, :) = fftshift(fft(vect(i, :)));
end

figure 
hold on
plot(0:l_int-1, Y(1, :));
title("FFT");




