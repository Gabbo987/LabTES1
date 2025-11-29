clc
clear

[y, Fs] = audioread("../Definitivo/Metallica - Fuel.wav", [1323001 2646000]);

save("MetallicaSampled.mat", "y", "Fs");

