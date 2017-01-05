function [ X, answer, newA, newB, n, isSDD, singular ] = jacobi( A, B, steps, initial, printLatex)

    n = size(B, 1);
    answer = zeros(n, steps+1);
    answer(:, 1) = initial;
    
     singular = 0;
    if (  abs(det(A)) < 1e-8   )
        singular = 1;
        return;
    end
    
    
    isSDD = chap6.checkSDD(A); %% if isSDD is 1 then the matrix is strictly diagonally dominant, otherwise it's not
    
     if isSDD == 0
        Atranspose = transpose(A);
        A = Atranspose*A;
        B = Atranspose*B;
    end
    
    for k=2:steps+1
        for i = 1:n
            t = 0;
            for j = 1:n
                if i~=j
                    t = vpa( t + A(i, j)*answer(j, k-1) );
                end
            end
            answer(i, k) = vpa(   (B(i) - t)/A(i, i)  );
        end
    end
    
    X = answer(:, steps+1);
    newA = A;
    newB = B;
    
        printOutput(X,n, printLatex);

    
    
    
end

