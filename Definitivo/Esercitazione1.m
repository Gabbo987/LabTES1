clear all
close all
clc

[y, Fs] = audioread("Metallica - Fuel.wav", [1323001 2646000]);

ly = length(y);
t = ly / Fs;
M = 0.5;
lint = ly/(t/M);

figure
hold on
plot(0:ly-1, y(:, 1));

x = zeros(1, lint);

for i = 1:(t/M)
    a = (i-1)*lint+1;
    b = i*lint;
    x(i, :) = y(a:b, 1);
end

figure
hold on
plot(0:M/lint, x(1, :));