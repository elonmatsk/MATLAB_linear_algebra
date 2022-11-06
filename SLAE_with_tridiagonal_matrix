k = 10; 
kk = 250; 
for n = [1,1:k] 
    N = n*kk; 
    a = ones(N, 1); 
    A = spdiags([a,-2*a,a], [-1,0,1], N, N); 
    %A = sprand(N, N, 3/N); 
    %A = A*A.'; 
    f = rand(N, 1); 
    for mm = 1:5 
        
        opts.SYM = false; 
        opts.POSDEF = false; 
        tic 
        X = A \ f; 
        TG(mm, n) = toc;  
         
        A = full(A);  
        tic 
        X = A \ f; 
        TAF(mm, n) = toc; 
    end; 
    T1 = min(TG); 
    F = min(TAF); 
end; 
 
semilogy((1:k)*kk, T1, 'b-', (1:k)*kk, F, ':', 'LineWidth', 2) 
legend('Sparse', 'Fool') 
grid on 
xlabel('n') 
ylabel('T(n)') 
title('Comparison')
