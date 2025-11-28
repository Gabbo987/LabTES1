clear all
close all
clc

[y, Fs] = audioread("Metallica - Fuel.wav", [1323001 2646000]);

ly = length(y);
t = ly / Fs;
M = 0.5;
lint = Fs * M;

figure
hold on
plot(0:ly-1, y(:, 1));
title("Plot canzone");

x = zeros(t/M, lint);

for i = 1:(t/M)
    a = (i-1)*lint+1;
    b = i*lint;
    x(i, :) = y(a:b, 1);
end

figure
hold on
plot(linspace(0, (lint-1)/Fs, lint), x(1, :));
title("Plot primo intervallo");