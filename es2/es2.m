clear
load handel.mat

[xo,Fs] = audioread("Metallica-Fuel.wav", [441000 1764000]);
info = audioinfo("Metallica-Fuel.wav")
x = xo(:,1);

% 1° h(n): passa-basso a porta unitaria
pb = zeros(1,1323000);
pb(1:661500) = 1;
t_pb = [1:1:1323000];
y = conv(x,pb);
X = fft(x);
Y = fft(y);
Y = Y(1:1323001);
H = Y./X;

% poi non ci resta che plottare X, Y e H e farlo con le altre 2 h(n)
% e ripetere il tutto con l'altro file musicale
