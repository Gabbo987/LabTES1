function X = dftIdeale(x)
    N = length(x);
    n = 0:N-1;
    k = 0:N-1;
    H = exp(-j*2*pi*n'*k/N);
    X = H*x';
end