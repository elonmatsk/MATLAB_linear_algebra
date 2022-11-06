k = 10;   
kk = 6;   
for n = [1,1:k]   
    N = (n*kk)^2;   
    nn=sqrt(N);  
    A=gallery('poisson',nn);  
    B = triu(A); 
    BB = B.'; 
    f = rand(N, 1);  
    conA(n) = condest(A) ;  
    S=eig(A);  
    Smin=min(S);  
    Smax=max(S);  
    tau=2/(Smin+Smax);  
    x=zeros(N,1);  
    r=A*x-f;    
    for mm = 1:5   
    tic  
     
    ii=1;  
    x=zeros(N,1);  
    Imax=15000;  
    r=A*x-f;  
    Err=norm(r)/norm(f);  
    EPS=1.e-8;  
    tic   
       [x,F,RR,Ipcg]=pcg(A,f,EPS,Imax, B, BB);   
        TG(mm, n) = toc;    
    tic   
       [x,F,RR,Ipcg]=pcg(A,f,EPS,Imax);   
        Tpcg(mm, n) = toc;   
     
     IIpcg(mm,n)=Ipcg;     
     
      
    I(mm,n)=ii;      
        tic   
        X = A \ f;   
        TAF(mm, n) = toc;   
          
    end;  
    TP=min(Tpcg); 
    T1 = min(TG);   
    FF = min(TAF);  
    II=min(I);  
    IIIpcg=min(IIpcg); 
end;   
subplot (2 , 1,1), semilogy(((1:k)*kk).^2, T1, 'm-', ((1:k)*kk).^2, TP ,((1:k)*kk).^2, FF, ':', 'LineWidth', 2)   
xlabel('N')   
ylabel('T(N)')  
legend('CG','PCG', 'Gauss method')   
title('Сравнение')  
grid on   
subplot (2 , 1, 2) , plot (conA,II,conA,IIIpcg);  
xlabel('Ka')   
ylabel('K(Ka)') 
legend('CG','PCG')  
title('Зависимость числа итераций \newline от размерности матрицы')  
grid on
