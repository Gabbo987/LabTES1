function X = dft2(x)

N = numel(x);
n = 0:N-1;
k = 0:N-1;
F = exp(-j*2*pi*n'*k/N);
X = (F*x')';

end