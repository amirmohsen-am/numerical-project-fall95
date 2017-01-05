function [ X, detA, detAi, n ] = cramer( A, B)

    n = size(B,1);
    X = zeros(n, 1);
    detA = vpa(  det(A)  );
    detAi = zeros(n, 1);
    for i = 1: n
        Ai = A;
        for j = 1 : n
            Ai(j, i) = B(j);
        end
        detAi(i) = vpa(  det(Ai) );
    end
    
    for i = 1:n
       X(i) = vpa(  detAi(i)/ detA  ); 
    end
    
    
end

