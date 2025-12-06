clear all
close all
clc

% Rendiamo un pezzo di 30 secondi del .waw in un vettore di campioni con
% sua frequenza di campionamento
[y, Fs] = audioread("Saint-Saens - Samson and Delilah.wav", [7008001 8448000]);
y = (y(:,1) + y(:,2))' / 2;

ly = length(y); % Numero totole di campioni della traccia
t = ly / Fs; % Tempo traccia
M = 0.5; % Fattore di campionamento intervallo
lint = Fs * M; % Numero di campioni per intervallo
nint = t/M; % Numero di intervalli 
n = (0:ly-1)/Fs; % Intervallo dei tempi normalizzato per andare da 0 a 30 secondi
ni = (0:lint-1)/Fs; % Come n ma per il singolo intervallo

x = reshape(y, lint, nint)';

X = zeros(nint, lint);

risultatiDftIdeale = zeros(5);
risultatiDft = zeros(5);
risultatiFft = zeros(5);


for j = 1:5
    tic
    for i=1:nint
        X(i, :) = dftIdeale(x(i, :));
    end
    y = toc;
    risultatiDftIdeale(i) = y;
end

for j = 1:5
    tic
    for i=1:nint
        X(i, :) = dft(x(i, :));
    end
    y = toc;
    risultatiDft(i) = y;
end

for j = 1:5
    tic
    for i=1:nint
        X(i, :) = fft(x(i, :));
    end
    y = toc;
    risultatiDftIdeale(i) = y;
end


risultatiDftIdeale
risultatiDft
risultatiFft