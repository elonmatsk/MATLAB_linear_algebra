k = 10; 
kk = 250; 
for n = [1,1:k] 
    N = n*kk; 
    A = rand(N); 
    f = rand(N, 1); 
    tic 
    X = A \ f; 
    T(n) = toc; 
end; 
S = (T(end) / (k*kk)^3)*((1:k)*kk).^3; 
plot((1:k)*kk, S, 'b--', (1:k)*kk, T, 'magenta') 
legend('\alpha * n^3', 'T(n)') 
grid 
xlabel('n') 
ylabel('T(n)') 
title('Complexity of the Gauss method') 
