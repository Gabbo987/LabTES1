function X = dft(x)
    N = length(x);
    n = 0:N-1;
    X = zeros(1, N);
    H = exp(-j*2*pi*n/N);
    for k=0:N-1
        X(1, k+1) = (H.^k)*x';
    end

    X = X';
end