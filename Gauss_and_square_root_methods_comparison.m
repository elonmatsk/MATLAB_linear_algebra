k = 10; 
kk = 250; 
for n = [1,1:k] 
    N = n*kk; 
    A = rand(N); 
    A = A*A.'; 
    f = rand(N, 1); 
    for mm = 1:5 
        opts.SYM = true; 
        opts.POSDEF = true;  
        tic 
        X = linsolve(A, f, opts); 
        TT(mm, n) = toc;
         
        opts.SYM = false; 
        opts.POSDEF = false; 
        tic 
        X = linsolve(A, f, opts); 
        TG(mm, n) = toc;
         
        tic 
        X = A \ f; 
        TAF(mm, n) = toc; 
    end; 
    T1 = min(TG) 
    T = min(TT) 
    S = min(TAF) 
end; 
 
plot((1:k)*kk, T1, 'b-', (1:k)*kk, T, 'm-', (1:k)*kk, S, ':') 
legend('T1(n)', 'T(n)', 'TAF(n)') 
grid 
xlabel('n') 
ylabel('T(n)') 
title('Comparison') 
