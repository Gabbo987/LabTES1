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

X = zeros(nint, lint);
Xt = zeros(nint, lint/2);

for i=1:1
    X(i, :) = dft(x(i, :));
    Xt(i, :) = X(i, 1:lint/2);
end

Xen = abs(Xt).^2; % Spettri degli intervalli dft
XenLog = 10*log10(Xen);

t0  = 30;
fmt = @(t) sprintf('%02d:%04.1f', floor(t/60), t - 60*floor(t/60));
ni2 = linspace(0, (lint/2)-1, lint/2)/1000;

for i = 1:1
    t_start = t0 + (i-1)*M;
    t_end   = t0 + i*M;
    
    % plot e export spettri degli intervalli dft scala logaritmica
    figure
    plot(ni2, XenLog(i, :), "Color", "b");
    title(sprintf('%da Finestra [%s - %s], M=0.5, scala logaritimica', i, fmt(t_start), fmt(t_end)));
    subtitle("    ");
    ylabel("Energia [dB]");
    xlabel("Frequenza [kHz]")
    nome_spettro = sprintf('10*log(S_{X_{%d}}(f))', i);
    legend(nome_spettro, 'Location', 'best');
    annotation('rectangle', [0 0 1 1], 'Color', 'b'); % Aggiunto per non far tagliare troppo i bordi da export

    filename = sprintf("SpettroDFTLog%d.png", i);
    exportgraphics(gcf, filename, "Resolution", 300);

    % plot e export spettri degli intervalli dft
    figure
    plot(ni2, Xen(i, :), "Color", "b");
    title(sprintf('%da Finestra [%s - %s], M=0.5, scala lineare', i, fmt(t_start), fmt(t_end)));
    subtitle("    ");
    ylabel("Energia ");
    xlabel("Frequenza [kHz]")
    nome_spettro = sprintf('S_{X_{%d}}', i);
    legend(nome_spettro, 'Location', 'best');
    annotation('rectangle', [0 0 1 1], 'Color', 'b');

    filename = sprintf("SpettroDFT%d.png", i);
    exportgraphics(gcf, filename, "Resolution", 300);
end