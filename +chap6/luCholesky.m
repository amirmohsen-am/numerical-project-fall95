function [ X, L, U, Atranspose, Y, newA, newB, n, singular ] = luCholesky( A, B, printLatex)
    
    n = size(B, 1);
    X = zeros(n, 1);
    L = zeros(n);
    Y = zeros(n, 1);
    
     singular = 0;
    if (  abs(det(A)) < 1e-8   )
        singular = 1;
        return;
    end
    
    Atranspose = transpose(A);
    A = Atranspose * A;
    B = Atranspose * B;
    
    for i = 1:n  %%calc L
        for j = i:n
            t = 0;
            for k = 1:i-1
                t = vpa(  t + L(i, k)*L(j, k)  ) ;
            end
            if (i==j)
                L(j,i) = vpa(   sqrt(A(i,j) - t)  );
            else
                L(j, i) = vpa(   (A(i, j) - t) / L(i, i)  )  ;
            end
        end
    end
    
    U = transpose(L);  %%calc U
    
    
    for i = 1:n   %%calc Y
        t = 0;
       for j = 1:i-1
          t = vpa(  t + L(i, j)*Y(j)  ); 
       end
       Y(i) = vpa(   (B(i) - t)/ L(i, i) );
    end
    
    
    
    for i = n:-1:1  %% calc X
       t = 0;
       for j = i+1:n
          t = vpa(  t + U(i, j)*X(j));
       end
       X(i) = vpa(   ( Y(i) - t ) / U(i, i)  );
    end
    
    newA = A;
    newB = B;
    
    %print latex
    
        chap6.printOutput(X,n, printLatex);

    
end

