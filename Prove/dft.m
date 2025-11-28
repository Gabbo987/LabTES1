function [X] = dft(x)

N = length(x);
X = zeros(1, N);

for k = 0:N-1
    sum = 0;
    for n = 0:N-1
        sum = sum + x(n+1) * exp(-j*2*pi*n*k/N);
    end
    X(k+1) = sum;
end
