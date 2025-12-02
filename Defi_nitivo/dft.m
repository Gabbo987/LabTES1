function X = dft(x)
    N = length(x);
    n = 0:N-1;
    X = zeros(1, N);
    W = exp(-j*2*pi*n/N);
    for k=0:N-1
        H = W.^k;
        X(1, k+1) = H*x';
        fprintf("%d\n", k);
    end

    X = X';
end