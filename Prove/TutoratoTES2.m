%%
clear all
close all
clc

N = 100;
fs = 1; % Ricorda limite di Naisquiz (o come si scrive) dove fs >= 2B, altrimenti sovrapposizioni

dk = zeros(1,N);
n = -N/2+1:N/2;
dk(N/2) = 1;

%figure(1)
%stem(n, dk)

u = ones(1, N);
u(1:N/2-1) = 0; 
%figure(2)
%stem(n, u)


% Se invece dico un fs > 1

fs = 100;
ts = 1/fs; % Tempo di campionamento
T = N*ts; % Tempo totale
n = 0:ts:T-ts;

f0 = 1/3;
x = cos(2*pi*f0*n);

figure(3)
stem(n, x);

%%
clear all
close all
clc

N = 10;
fs = 1;
ts = 1/fs;
T = N*ts;
n = 0:ts:T-ts;
f = -fs/2:fs/N:fs/2-fs/N; % il -fs/N perche sarebbe il valore che trovo gia in -1/2 mi darebbe un punto in piu rispetto al vettore da plottare

% se N fosse dispari
fd = -fs/2+fs/(N*2):fs/N:fs/2-fs(2*N);

%%
a = 1:10;
b = 10:19;

a'*b
a*b'

%%
conv % fa la convoluzione
xcorr % fa la correlazione

%%
