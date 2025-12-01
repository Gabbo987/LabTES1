clear all
close all
clc

% Rendiamo un pezzo di 30 secondi del .waw in un vettore di campioni con
% sua frequenza di campionamento
[y, Fs] = audioread("Metallica - Fuel.wav", [1323001 2646000]);

ly = length(y); % Numero totole di campioni della traccia
t = ly / Fs; % Tempo traccia
M = 0.5; % Fattore di campionamento intervallo
lint = Fs * M; % Numero di campioni per intervallo
nint = t/M; % Numero di intervalli 
n = (0:ly-1)/Fs; % Intervallo dei tempi normalizzato per andare da 0 a 30 secondi
ni = (0:lint-1)/Fs; % Come n ma per il singolo intervallo

% Reshape prende in ordine gli elementi degli array e li mette a matrice
% completando per colonna (prima colonna 1, poi 2, ..., poi n)
y = (y(:,1))'; % Traspongo perche boh sembra serva una riga per reshape
x = reshape(y, lint, nint)';

% Ho implementato la dft in modo da avere lo stesso comportamento
% Quindi mi aspetto che lungo una colonna ci sia un segnale da trasformare

nint = 1;

X = zeros(nint, lint);
Xt = zeros(nint, lint/2);

for i=1:1
    X(i, :) = dft(x(i, :));
    Xt(i, :) = X(i, 1:lint/2);
end

sXd = 10*log10(abs(Xt).^2); % Spettri degli intervalli dft


dur = 0.5;     % lunghezza finestra
t0  = 30;      % tempo iniziale (30 s)



% funzione formattazione tempo
fmt = @(t) sprintf('%02d:%04.1f', floor(t/60), t - 60*floor(t/60));

for i = 1:nint
    figure
    hold on
    plot(linspace(0, lint/2-1, lint/2)/1000, sXd(i, :));

    t_start = t0 + (i-1)*dur;
    t_end   = t0 + i*dur;
    title(sprintf('%da Finestra [%s - %s], M=0.5', i, fmt(t_start), fmt(t_end)));
    ylabel("Energia");
end