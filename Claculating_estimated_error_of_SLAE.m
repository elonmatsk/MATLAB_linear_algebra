N = 10; 
for n = 2:N 
    A = hilb(n); 
    As = single(A); 
    f = rand(n,1); 
    fs = single(f); 
    conA(n) = cond(A); 
    x = A \ f; 
    xs = As \ fs; 
    dact(n) = norm(x - xs) / norm(x); 
    dest(n) = conA(n)*norm(f - fs) / norm(f); 
end; 
subplot(1, 2, 1), semilogy(2:N, conA(2:N)) 
subplot(1, 2, 2), semilogy(2:N, dact(2:N), 2:N, dest(2:N)) 
